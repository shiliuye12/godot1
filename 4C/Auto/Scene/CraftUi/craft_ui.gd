extends Control

@onready var minus: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/minus
@onready var line_edit: LineEdit = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit
@onready var plus: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/plus
@onready var recipe_slot: Array = $MarginContainer/HBoxContainer/VBoxContainer/GridContainer2.get_children()
@onready var queue_slot: Array = $MarginContainer/HBoxContainer/VBoxContainer/GridContainer.get_children()
@onready var recipe_data = preload("uid://cy6v05nmqncyp")
@onready var slotitem = preload("uid://d2jwiye4h32fi")
@onready var ui_slot: Button = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/uiSlot
@onready var ui_name: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/uiName
@onready var ms: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/ColorRect/MarginContainer/VBoxContainer/ms
@onready var asset: Label = $MarginContainer/HBoxContainer/MarginContainer/ColorRect/MarginContainer/VBoxContainer/ColorRect/MarginContainer/VBoxContainer/asset

var number = 1
var xz_sx = -1
var craft_queue: Array

func _ready() -> void:
	craft_bag_ui_update()
	Global.button_on.connect(_button_on)

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
			else:
				if xz_sx == i:
					continue
				xz_sx = i
	if xz_gs >= 2:
		Global.button_off.emit()
		xz_sx = -1
	if xz_sx != -1:
		if !ui_slot.wp:
			var new_slot = slotitem.instantiate()
			ui_slot.spawn(new_slot)
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		if recipe_data.recipes[xz_sx] == null:
			slot_.item = null
			slot_.number = 0
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
