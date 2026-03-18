extends Control

class_name SlotItem

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label

var slot_: Slot

func slot_item_update():
	if !slot_ or !slot_.item: return
	
	texture_rect.visible = true
	texture_rect.texture = slot_.item.texture
	
	if slot_.count > 0:
		label.visible = true
		label.text = str(slot_.count)
	
