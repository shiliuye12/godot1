extends Area2D
class_name Residence

@export var rect: Rect2
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var number = 0

const TILEMAP_PACKED = preload("uid://cvw31tsv8qmjo")

var slot_: Slot

func update():
	sprite_2d.texture = slot_.item.texture

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1

func _ready() -> void:
	PlayerFrz.frz += 200

func update_sprite():
	if number == 1:
		sprite_2d.texture = TILEMAP_PACKED
	elif number == 2:
		sprite_2d.texture = TILEMAP_PACKED
	elif number == 3:
		sprite_2d.texture = TILEMAP_PACKED
