extends Control

@onready var minus: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/minus
@onready var line_edit: LineEdit = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit
@onready var plus: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/plus
@onready var recipe_slot: Array = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer2.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer3.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer4.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer5.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer6.get_children() + \
$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer7.get_children()
@onready var queue_slot: Array = $MarginContainer/HBoxContainer/VBoxContainer/GridContainer.get_children()
@onready var recipe_data = preload("res://Resource/recipe_data.tres")
@onready var slotitem = preload("uid://d2jwiye4h32fi")
@onready var ui_slot: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/uiSlot
@onready var ui_name: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/uiName
@onready var ms: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/ColorRect/MarginContainer/VBoxContainer/ms
@onready var asset: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/ColorRect/MarginContainer/VBoxContainer/asset
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var production_queue = preload("res://Resource/production_queue_data.tres")
@onready var timer: Timer = $Timer

var number = 1
var xz_sx = -1

func _ready() -> void:
	craft_bag_ui_update()
	Global.button_on.connect(_button_on)
	Global.recipe_change.connect(_recipe_change)

func _recipe_change():
	craft_bag_ui_update()

func craft_bag_ui_update():
	for i in range(recipe_slot.size()):
		if recipe_data.recipes[i]:
			if !recipe_data.recipes[i].outitem:
				if !recipe_data.recipes[i].outitem:
					recipe_slot[i].wp.queue_free()
					recipe_slot[i].wp = null
				continue
			if !recipe_slot[i].wp:
				var new_slot = slotitem.instantiate()
				recipe_slot[i].spawn(new_slot)
			var slot_: Slot = Slot.new()
			slot_.item = Item.new()
			slot_.item = recipe_data.recipes[i].outitem
			slot_.number = 0
			recipe_slot[i].wp.slot_ = slot_
			recipe_slot[i].wp.update()

func queue_slot_update():
	for i in range(queue_slot.size()):
		if production_queue.production_queue[i]:
			if !production_queue.production_queue[i].item:
				if queue_slot[i].wp:
					queue_slot[i].wp.queue_free()
					queue_slot[i].wp = null
					continue
			if !queue_slot[i].wp:
				var new_slot = slotitem.instantiate()
				queue_slot[i].spawn(new_slot)
			var slot_: Slot = Slot.new()
			slot_.item = Item.new()
			if production_queue.production_queue[i].item:
				slot_.item = production_queue.production_queue[i].item
				slot_.number = production_queue.production_queue[i].number
			elif !production_queue.production_queue[i].item:
				slot_.item = null
				slot_.number = 0
			queue_slot[i].wp.slot_ = slot_
			queue_slot[i].wp.update()

func _process(delta: float) -> void:
	if production_queue.production_queue[0].item and timer.is_stopped():
		timer.start()
	queue_slot_update()

func production():
	for i in player_data.Slots.size():
		if player_data.Slots[i].item == production_queue.production_queue[0].item:
			player_data.Slots[i].number += 1
			production_queue.production_queue[0].number -= 1
			if production_queue.production_queue[0].number <= 0:
				for j in production_queue.production_queue.size() - 1:
					production_queue.production_queue[j].item = production_queue.production_queue[j + 1].item
					production_queue.production_queue[j].number = production_queue.production_queue[j + 1].number
				production_queue.production_queue[7].item = null
				production_queue.production_queue[7].number = 0
			save_data()
			return
	for i in player_data.Slots.size():
		if player_data.Slots[i].item == null:
			player_data.Slots[i].item = production_queue.production_queue[0].item
			player_data.Slots[i].number = 1
			production_queue.production_queue[0].number -= 1
			if production_queue.production_queue[0].number <= 0:
				for j in production_queue.production_queue.size() - 1:
					production_queue.production_queue[j].item = production_queue.production_queue[j + 1].item
					production_queue.production_queue[j].number = production_queue.production_queue[j + 1].number
				production_queue.production_queue[7].item = null
				production_queue.production_queue[7].number = 0
			save_data()
			return

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit") and self.visible == true:
		self.visible = false
		Global.button_off.emit()
		xz_sx = -1
		number = 1
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item = null
		slot_.number = 0
		if ui_slot.wp:
			ui_slot.wp.slot_ = slot_
		ui_name.text = ""
		ms.text = ""
		asset.text = ""
		if ui_slot.wp:
			ui_slot.wp.update()

func _on_line_edit_text_changed(new_text: String) -> void:
	number = int(new_text)
	line_edit.text = str(number)

func _on_minus_pressed() -> void:
	if number > 1:
		number -= 1
		line_edit.text = str(number)

func _on_plus_pressed() -> void:
	number += 1
	line_edit.text = str(number)

func _button_on():
	var xz_gs = 0
	for i in range(recipe_slot.size()):
		if !recipe_slot[i].wp:
			var new_slot = slotitem.instantiate()
			recipe_slot[i].spawn(new_slot)
		if recipe_slot[i].color_rect.visible == true:
			xz_gs += 1
			if xz_sx == -1:
				xz_sx = i
	if xz_gs >= 2:
		Global.button_off.emit()
		xz_sx = -1
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item = null
		slot_.number = 0
		ui_slot.wp.slot_ = slot_
		ui_name.text = ""
		ms.text = ""
		asset.text = ""
		number = 1
		ui_slot.wp.update()
	if xz_sx != -1:
		if !ui_slot.wp:
			var new_slot = slotitem.instantiate()
			ui_slot.spawn(new_slot)
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		if recipe_data.recipes[xz_sx] == null:
			slot_.item = null
			slot_.number = 0
			ui_slot.wp.slot_ = slot_
			ui_name.text = ""
			ms.text = ""
			asset.text = ""
		else:
			slot_.item = recipe_data.recipes[xz_sx].outitem
			slot_.number = 0
			ui_slot.wp.slot_ = slot_
			ui_name.text = recipe_data.recipes[xz_sx].outitem.name
			ms.text = recipe_data.recipes[xz_sx].outitem.ms
			if recipe_data.recipes[xz_sx].inputitem2 == "":
				asset.text = recipe_data.recipes[xz_sx].inputitem1 + "X" + str(recipe_data.recipes[xz_sx].inputCount1)
			else:
				asset.text = recipe_data.recipes[xz_sx].inputitem1 + "X" + str(recipe_data.recipes[xz_sx].inputCount1) + recipe_data.recipes[xz_sx].inputitem2 + "X" + str(recipe_data.recipes[xz_sx].inputCount2)
		ui_slot.wp.update()

func _on_craft_button_pressed() -> void:
	var can_carft = 0
	var item_1
	var item_2
	if ui_slot.wp.slot_:
		if number > 0 and ui_slot.wp.slot_.item:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.name == recipe_data.recipes[xz_sx].inputitem1\
					and player_data.Slots[i].number >= recipe_data.recipes[xz_sx].inputCount1 * number:
						can_carft += 1
						item_1 = i
					if recipe_data.recipes[xz_sx].inputCount2 != 0:
						if player_data.Slots[i].item.name == recipe_data.recipes[xz_sx].inputitem2\
						and player_data.Slots[i].number >= recipe_data.recipes[xz_sx].inputCount2 * number:
							can_carft += 1
							item_2 = i
			if recipe_data.recipes[xz_sx].inputCount2 == 0:
				if can_carft == 1:
					for i in production_queue.production_queue.size():
						if production_queue.production_queue[i].item == null:
							player_data.Slots[item_1].number -= recipe_data.recipes[xz_sx].inputCount1 * number
							production_queue.production_queue[i].item = recipe_data.recipes[xz_sx].outitem
							production_queue.production_queue[i].number += number
							save_data()
							return
			elif recipe_data.recipes[xz_sx].inputCount2 != 0:
				if can_carft == 2:
					for i in production_queue.production_queue.size():
						if production_queue.production_queue[i].item == null:
							player_data.Slots[item_1].number -= recipe_data.recipes[xz_sx].inputCount1 * number
							player_data.Slots[item_2].number -= recipe_data.recipes[xz_sx].inputCount2 * number
							production_queue.production_queue[i].item = recipe_data.recipes[xz_sx].outitem
							production_queue.production_queue[i].number += number
							save_data()
							return

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _on_timer_timeout() -> void:
	production()
