extends CanvasLayer
@onready var bag_slot: Array = $Control/MarginContainer/HBoxContainer/GridContainer.get_children()
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var slotitem = preload("res://Scene/SlotItem/slot_item.tscn")
@onready var ui_slot: Button = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/uiSlot
@onready var ui_name: Label = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/uiName
@onready var ms: Label = $Control/MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/ColorRect/MarginContainer/ms

var xz_sx = -1
var building

func _ready() -> void:
	bag_update()
	Global.button_on.connect(_button_on)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("right_shubiao"):
		Global.button_off.emit()
		xz_sx = -1

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
		if !ui_slot.wp:
			var new_slot = slotitem.instantiate()
			ui_slot.spawn(new_slot)
			var slot_: Slot = Slot.new()
			slot_.item = Item.new()
			ui_slot.wp.slot_ = slot_
		bag_slot[i].wp.slot_ = player_data.Slots[i]
		bag_slot[i].wp.update()

func _button_on():
	if xz_sx != -1:
		xz_sx = -1
		Global.button_off.emit()
		ui_slot_update()
		return
	for i in range(player_data.Slots.size()):
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		if bag_slot[i].color_rect.visible == true:
			xz_sx = i
			ui_slot_update()
			return

func ui_slot_update():
	if player_data.Slots[xz_sx].item:
		ui_slot.wp.slot_.item = player_data.Slots[xz_sx].item
		ui_slot.wp.slot_.number = player_data.Slots[xz_sx].number
		ui_name.text = ui_slot.wp.slot_.item.name
		ms.text = ui_slot.wp.slot_.item.ms
		ui_slot.wp.update()
	else:
		ui_slot.wp.slot_.item = null
		ui_slot.wp.slot_.number = 0
		ui_name.text = ""
		ms.text = ""
		ui_slot.wp.update()

func _on_craft_button_pressed() -> void:
	if ui_slot.wp.slot_ == null:
		return
	if building:
		building.out_item_data.slot = ui_slot.wp.slot_
		building.out_item_data.number = ui_slot.wp.slot_.number
		queue_free()

func _process(delta: float) -> void:
	bag_update()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		queue_free()
