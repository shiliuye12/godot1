extends MarginContainer

class_name SlotItem

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label

var slot_: Slot

func update():
	texture_rect.texture = slot_.item.texture
	label.text = str(slot_.number)
