extends Area2D
class_name ImperialPalace

@export var rect: Rect2
@onready var sprite_2d: Sprite2D = $Sprite2D
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
	PlayerFrz.frz += 10000

func update_sprite():
	sprite_2d.texture = TILEMAP_PACKED
