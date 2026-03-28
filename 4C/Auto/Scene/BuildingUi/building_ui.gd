extends CanvasLayer

@onready var bag_slot: Array = $Control/MarginContainer/HBoxContainer/MarginContainer2/ColorRect/MarginContainer/ScrollContainer/GridContainer\
.get_children()
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var slotitem = preload("res://Scene/SlotItem/slot_item.tscn")
var xz_sx = -1
var xz_sx2 = -1
var xz_sx3 = -1
var building
@onready var building_slot1: Button = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/HBoxContainer/VBoxContainer/Slot
@onready var building_slot2: Button = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/HBoxContainer/VBoxContainer/Slot2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		queue_free()

func _ready() -> void:
	bag_update()
	Global.button_on.connect(_button_on)
	#Global.items_change.connect(_items_change)

func open(item_data: Dictionary):
	if item_data.number != 0:
		building_slot1.wp.slot_ = item_data.slot
		building_slot1.wp.slot_.number = item_data.number
		building_slot1.wp.update()

func bag_update():
	for i in range(player_data.Slots.size()):
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
		if xz_sx != -1 and xz_sx3 != -1:
			slot_jh()
			Global.button_off.emit()
	if xz_gs >= 2:
		slot_jh()
		xz_sx = -1
		xz_sx2 = -1
		xz_sx3 = -1
		Global.button_off.emit()

func slot_jh():
	if xz_sx3 == -1:
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
	elif xz_sx3 != -1:
		var temp_slot: Slot = player_data.Slots[xz_sx]
		player_data.Slots[xz_sx] = building_slot1.wp.slot_
		player_data.Slots[xz_sx].number = building_slot1.wp.slot_.number
		building_slot1.wp.slot_ = temp_slot
		building.items_data.slot = temp_slot
		building.items_data.number = temp_slot.number
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

#func _items_change(item_data: Dictionary):
	#building_slot1.wp.slot_ = item_data.slot
	#building_slot1.wp.slot_.number = item_data.number
	#building_slot1.wp.update()

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _process(delta: float) -> void:
	if building:
		building_slot1.wp.slot_ = building.items_data.slot
		if building_slot1.wp.slot_:
			building_slot1.wp.slot_.number = building.items_data.number
			building_slot1.wp.update()
