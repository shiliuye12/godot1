extends Area2D

@onready var timer: Timer = $Timer
const ITEM = preload("uid://ctxgnbdmr5o2n")
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

var _can_sc = false   
func _on_timer_timeout() -> void:
	var item = ITEM.instantiate()
	add_child(item)
	item.global_position = collision_shape_2d.global_position

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is CSD:
		_can_sc = true
		timer.start()



@export var rect: Rect2

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
