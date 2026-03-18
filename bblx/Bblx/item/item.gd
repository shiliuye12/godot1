extends Node2D
class_name WP

@onready var sprite_2d: Sprite2D = $Sprite2D
var _can_move = true
var speed

var slot_: Slot
var move_fx: Vector2

func update():
	sprite_2d.texture = slot_.item.texture

func move():
	_can_move = false
	await get_tree().create_timer(0.38).timeout
	_can_move = true

func _process(delta: float) -> void:
	if !_can_move:
		position += speed * move_fx * delta


func _on_button_pressed() -> void:
	print(1)
	queue_free()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_shubiao"):
		queue_free()
