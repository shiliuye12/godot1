extends Sprite2D

@export var rect: Rect2
@onready var object: Sprite2D = $"."

var slot_: Slot

func update():
	object.texture = slot_.item.texture

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
