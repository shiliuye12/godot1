extends Control

@onready var bag_slot_grid_container: GridContainer = $PanelContainer/VBoxContainer/BagSlotGridContainer
@onready var hot_bar_container: HBoxContainer = $PanelContainer/VBoxContainer/HotBarContainer
@onready var bag_slots: Array = $PanelContainer/VBoxContainer/HotBarContainer.get_children() + $PanelContainer/VBoxContainer/BagSlotGridContainer.get_children()

@onready var bag_inventory : Inventory = preload("res://bb/player_inventory.tres")
@onready var slotitem_ = preload("res://bb/slot_item.tscn")

func _ready() -> void:
	bag_update()

func bag_update():
	if bag_inventory.slots.size() != bag_slots.size(): return
	for i in range(bag_slots.size()):
		var inventory_slots: Slot = bag_inventory.slots[i]
		if !inventory_slots:
			if bag_slots[i].slot_button_slot_item:
				bag_slots[i].slot_button_slot_item.queue_free()
				bag_slots[i].slot_button_slot_item = null
			bag_slots[i].reset_color()
			continue
		if !inventory_slots.item:
			if bag_slots[i].slot_button_slot_item:
				bag_slots[i].slot_button_slot_item.queue_free()
				bag_slots[i].slot_button_slot_item = null
			bag_slots[i].reset_color()
			continue
		
		var slot_item = bag_slots[i].slot_button_slot_item
		if !slot_item:
			slot_item = slotitem_.instantiate()
			bag_slots[i].insert(slot_item)
		slot_item.slot_ = inventory_slots
		slot_item.slot_item_update()
