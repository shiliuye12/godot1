extends Area2D

class_name Paddle
const SPEED = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
	
	position.x = clampf(
		position.x,
		get_viewport_rect().position.x,
		get_viewport_rect().end.x
	)
