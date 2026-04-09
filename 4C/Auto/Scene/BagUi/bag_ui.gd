extends Control

@onready var bag_slot: Array = $MarginContainer/VBoxContainer/MarginContainer2/GridContainer\
.get_children() + $MarginContainer/VBoxContainer/MarginContainer/GridContainer\
.get_children()
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var slotitem = preload("res://Scene/SlotItem/slot_item.tscn")
var xz_sx = -1
var xz_sx_2 = -1
var bag_inventory_array: Array
var bag_inventory_array_number: Array

func _ready() -> void:
	bag_update()
	Global.button_on.connect(_button_on)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("right_shubiao"):
		Global.button_off.emit()
		xz_sx = -1
		xz_sx_2 = -1
	if event.is_action_pressed("bag_inventory"):
		bag_inventory()

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
				xz_sx_2 = i
	if xz_gs >= 2:
		slot_jh()
		Global.button_off.emit()

func slot_jh():
	if player_data.Slots[xz_sx].item == null or player_data.Slots[xz_sx_2].item == null:
		var temp_slot: Slot = player_data.Slots[xz_sx]
		player_data.Slots[xz_sx] = player_data.Slots[xz_sx_2]
		player_data.Slots[xz_sx_2] = temp_slot
		xz_sx = -1
		xz_sx_2 = -1
		save_data()
		bag_update()
	elif player_data.Slots[xz_sx].item.id != player_data.Slots[xz_sx_2].item.id:
		var temp_slot: Slot = player_data.Slots[xz_sx]
		player_data.Slots[xz_sx] = player_data.Slots[xz_sx_2]
		player_data.Slots[xz_sx_2] = temp_slot
		xz_sx = -1
		xz_sx_2 = -1
		save_data()
		bag_update()
	elif player_data.Slots[xz_sx].item.id == player_data.Slots[xz_sx_2].item.id:
		player_data.Slots[xz_sx_2].number += player_data.Slots[xz_sx].number
		player_data.Slots[xz_sx].item = null
		player_data.Slots[xz_sx].number = 0
		xz_sx = -1
		xz_sx_2 = -1
		save_data()
		bag_update()
	
func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _process(delta: float) -> void:
	bag_update()

func bag_inventory() -> void:
	var merge_dict: Dictionary = {}
	
	for slot in player_data.Slots:
		if slot.item and slot.number > 0:
			var item_id = slot.item.id
			
			if merge_dict.has(item_id):
				merge_dict[item_id].number += slot.number
			else:
				merge_dict[item_id] = {
					"item": slot.item,
					"number": slot.number
				}
	
	var merged_array: Array = []
	for key in merge_dict:
		merged_array.append(merge_dict[key])
	
	merged_array.sort_custom(func(a, b):
		return a.item.id < b.item.id
	)
	
	for i in range(player_data.Slots.size()):
		if i < merged_array.size():
			player_data.Slots[i].item = merged_array[i].item
			player_data.Slots[i].number = merged_array[i].number
		else:
			player_data.Slots[i].item = null
			player_data.Slots[i].number = 0
	save_data()
