extends Area2D

var is_left: bool = true:
	get:
		return is_left
	set(a):
		is_left = a

const SPPED: int = 60

@onready var sprite_2d: Sprite2D = $Sprite2D


@export var score: int = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_left == true:
		position.x += SPPED * delta
	else:
		sprite_2d.flip_h = false
		position.x -= SPPED * delta
	queue_free_enemy()

func queue_free_enemy():
	if position.x > get_viewport_rect().end.x + 1000 or position.x < get_viewport_rect().position.x - 1000:
		queue_free()



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.score >= score:
			body.score += 10
			HubSignal.on_score_up.emit(body.score)
			queue_free()
		elif body.is_hurt == false:
			HubSignal.on_player_hurt.emit()
		else:
			return
