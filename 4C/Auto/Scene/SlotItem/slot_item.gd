extends MarginContainer
class_name SlotItem

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $MarginContainer/Label

var slot_: Slot

func update():
	if !slot_:
		texture_rect.texture = null
		label.text = ""
	elif slot_.item != null:
		texture_rect.texture = slot_.item.texture
		label.text = str(slot_.number)
		if slot_.number == 0:
			label.text = ""
	else:
		texture_rect.texture = null
		label.text = ""
