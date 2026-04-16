extends CanvasLayer

@onready var bag_slot: Array = $Control/MarginContainer/HBoxContainer/MarginContainer2/ColorRect/MarginContainer/ScrollContainer/GridContainer\
.get_children()
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var slotitem = preload("res://Scene/SlotItem/slot_item.tscn")
var xz_sx = -1
var xz_sx2 = -1
var xz_sx3 = -1
var xz_sx4 = -1
var building
var recipe: Array
@onready var building_slot1: Button = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/Slot
@onready var building_slot2: Button = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/Slot2
@onready var repice_ui: VBoxContainer = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/RepiceUi
@onready var recipe_data = preload("res://Resource/recipe_data.tres")
@onready var repice_v_box: VBoxContainer = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/RepiceUi/ColorRect/MarginContainer/ScrollContainer/RepiceVBox
@onready var recipe_text: Label = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer2/ColorRect2/MarginContainer/RecipeText
@onready var building_slot3: Button = $Control/Slot

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		queue_free()

func _ready() -> void:
	bag_update()
	Global.button_on.connect(_button_on)
	#Global.items_change.connect(_items_change)
	recipe = building.recipes
	for i in recipe.size():
		var btn = Button.new()
		btn.pressed.connect(_on_recipe_button.bind(i))
		repice_v_box.add_child(btn)
		btn.custom_minimum_size = Vector2(50, 40)
		btn.text = recipe[i].outitem.name

func open(item_data: Dictionary):
	pass
	#if item_data.number != 0:
		#building_slot1.wp.slot_ = item_data.slot
		#building_slot1.wp.slot_.number = item_data.number
		#building_slot1.wp.update()

func bag_update():
	for i in range(player_data.Slots.size()):
		if player_data.Slots[i]:
			if !player_data.Slots[i].item:
				if bag_slot[i].wp:
					bag_slot[i].wp.queue_free()
					bag_slot[i].wp = null
				continue
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		bag_slot[i].wp.slot_ = player_data.Slots[i]
		bag_slot[i].wp.update()
	if !building_slot1.wp:
		var new_slot = slotitem.instantiate()
		building_slot1.spawn(new_slot)
	if !building_slot2.wp:
		var new_slot = slotitem.instantiate()
		building_slot2.spawn(new_slot)
	if !building_slot3.wp:
		var new_slot = slotitem.instantiate()
		building_slot3.spawn(new_slot)

func _button_on():
	var xz_gs = 0
	for i in range(player_data.Slots.size()):
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		if bag_slot[i].color_rect.visible == true:
			xz_gs += 1
			if xz_sx == -1:
				xz_sx = i
			else:
				if xz_sx == i:
					continue
				xz_sx2 = i
	if building_slot1.color_rect.visible == true:
		xz_sx3 = 1
		if xz_sx != -1:
			slot_jh()
			Global.button_off.emit()
	if building_slot3.color_rect.visible == true:
		xz_sx4 = 1
		if xz_sx != -1:
			slot_jh()
			Global.button_off.emit()
	if xz_sx3 == 1 and xz_sx4 == 1:
		slot_jh()
		Global.button_off.emit()
	if xz_gs >= 2:
		slot_jh()
		xz_sx = -1
		xz_sx2 = -1
		xz_sx3 = -1
		xz_sx4 = -1
		Global.button_off.emit()

func slot_jh():
	if xz_sx3 == -1 and xz_sx4 == -1:
		if player_data.Slots[xz_sx].item == null or player_data.Slots[xz_sx2].item == null:
			var temp_slot: Slot = player_data.Slots[xz_sx]
			player_data.Slots[xz_sx] = player_data.Slots[xz_sx2]
			player_data.Slots[xz_sx2] = temp_slot
			xz_sx = -1
			xz_sx2 = -1
			save_data()
			bag_update()
		elif player_data.Slots[xz_sx].item.id != player_data.Slots[xz_sx2].item.id:
			var temp_slot: Slot = player_data.Slots[xz_sx]
			player_data.Slots[xz_sx] = player_data.Slots[xz_sx2]
			player_data.Slots[xz_sx2] = temp_slot
			xz_sx = -1
			xz_sx2 = -1
			save_data()
			bag_update()
		elif player_data.Slots[xz_sx].item.id == player_data.Slots[xz_sx2].item.id:
			player_data.Slots[xz_sx2].number += player_data.Slots[xz_sx].number
			player_data.Slots[xz_sx].item = null
			player_data.Slots[xz_sx].number = 0
			xz_sx = -1
			xz_sx2 = -1
			save_data()
			bag_update()
	elif xz_sx3 != -1 and xz_sx4 == -1:
		var temp_slot: Slot = Slot.new()
		temp_slot.item = Item.new()
		temp_slot.item = player_data.Slots[xz_sx].item
		temp_slot.number = player_data.Slots[xz_sx].number
		if building_slot1.wp.slot_ == null:
			player_data.Slots[xz_sx].item = null
			player_data.Slots[xz_sx].number = 0
		else:
			player_data.Slots[xz_sx] = building_slot1.wp.slot_
		if player_data.Slots[xz_sx]:
			if building_slot1.wp.slot_ == null:
				player_data.Slots[xz_sx].number = 0
			else:
				player_data.Slots[xz_sx].number = building_slot1.wp.slot_.number
			building.items_data.number = temp_slot.number
		building_slot1.wp.slot_ = temp_slot
		building.items_data.slot = temp_slot
		if player_data.Slots[xz_sx]:
			if temp_slot.number == 0:
				building.items_data.slot = null
				building.items_data.number = 0
		#Global.ui_items_change.emit(building_slot1.wp.slot_)
		xz_sx = -1
		xz_sx2 = -1
		xz_sx3 = -1
		save_data()
		building_slot1.wp.update()
		bag_update()
	elif xz_sx3 != -1 and xz_sx4 != -1:
		var temp_slot: Slot = Slot.new()
		temp_slot.item = Item.new()
		if building_slot3.wp.slot_:
			temp_slot.item = building.items_data2.slot.item
			temp_slot.number = building.items_data2.number
		else:
			temp_slot.item = null
			temp_slot.number = 0
		
		building.items_data2.slot.item = building.items_data.slot.item
		building.items_data2.number = building.items_data.number
		
		building.items_data.slot.item = temp_slot.item
		building.items_data.number = temp_slot.number
		xz_sx = -1
		xz_sx2 = -1
		xz_sx3 = -1
		xz_sx4 = -1
		bag_update()
	elif xz_sx3 == -1 and xz_sx4 != -1:
		var temp_slot: Slot = Slot.new()
		temp_slot.item = Item.new()
		temp_slot.item = player_data.Slots[xz_sx].item
		temp_slot.number = player_data.Slots[xz_sx].number
		if building_slot3.wp.slot_ == null:
			player_data.Slots[xz_sx].item = null
			player_data.Slots[xz_sx].number = 0
		else:
			player_data.Slots[xz_sx] = building_slot3.wp.slot_
		if player_data.Slots[xz_sx]:
			if building_slot3.wp.slot_ == null:
				player_data.Slots[xz_sx].number = 0
			else:
				player_data.Slots[xz_sx].number = building_slot3.wp.slot_.number
			building.items_data2.number = temp_slot.number
		building_slot3.wp.slot_ = temp_slot
		building.items_data2.slot = temp_slot
		if player_data.Slots[xz_sx]:
			if temp_slot.number == 0:
				building.items_data2.slot = null
				building.items_data2.number = 0
		#Global.ui_items_change.emit(building_slot3.wp.slot_)
		xz_sx = -1
		xz_sx2 = -1
		xz_sx3 = -1
		xz_sx4 = -1
		save_data()
		building_slot2.wp.update()
		bag_update()

#func _items_change(item_data: Dictionary):
	#building_slot1.wp.slot_ = item_data.slot
	#building_slot1.wp.slot_.number = item_data.number
	#building_slot1.wp.update()

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _process(delta: float) -> void:
	if building:
		building_slot1.wp.slot_ = building.items_data.slot
		building_slot2.wp.slot_ = building.out_item_data.slot
		building_slot3.wp.slot_ = building.items_data2.slot
		if building_slot1.wp.slot_:
			building_slot1.wp.slot_.number = building.items_data.number
			building_slot1.wp.update()
		if building_slot2.wp.slot_:
			building_slot2.wp.slot_.number = building.out_item_data.number
			building_slot2.wp.update()
		if building_slot3.wp.slot_:
			building_slot3.wp.slot_.number = building.items_data2.number
			building_slot3.wp.update()
		if building.items_data.number <= 0:
			building_slot1.wp.slot_ = null
			building_slot1.wp.update()
		if building.out_item_data.number <= 0:
			building_slot2.wp.slot_ = null
			building_slot2.wp.update()
		if building.items_data2.number <= 0:
			building_slot3.wp.slot_ = null
			building_slot3.wp.update()

func _on_recipe_button_pressed() -> void:
	if repice_ui.visible == true:
		repice_ui.hide()
	else:
		repice_ui.show()
		#for i in recipe.size():
			#recipe_button[i].text = str(recipe[i].outitem.name)

func _on_recipe_button(i: int):
	building.recipe_wz = i
	recipe_text.text = building.recipes[i].inputitem1 + "X" + str(building.recipes[i].inputCount1)
	if building.recipes[i].inputCount2 != 0:
		recipe_text.text = building.recipes[i].inputitem1 + "X" + str(building.recipes[i].inputCount1) + "\n" \
		+ "+" + building.recipes[i].inputitem2 + "X" + str(building.recipes[i].inputCount2)
