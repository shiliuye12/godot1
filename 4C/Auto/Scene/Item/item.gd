extends CharacterBody2D
class_name item

@onready var sprite_2d: Sprite2D = $Sprite2D


var slot_: Slot
var move: Vector2 = Vector2(0, 0)
var speed = 75
var _can_move = true

func update():
	sprite_2d.texture = slot_.item.texture

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left"):
		queue_free()

func _process(delta: float) -> void:
	if !_can_move:
		global_position += speed * delta * move

func can_move():
	_can_move = false
	await get_tree().create_timer(0.5).timeout
	_can_move = true
	move = Vector2(0, 0)




@export var rect: Rect2

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
