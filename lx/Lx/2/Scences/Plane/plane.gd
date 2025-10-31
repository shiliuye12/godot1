extends CharacterBody2D

class_name  plane

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const JUMP = -450
var _g = 980.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	velocity.y += _g * delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP
		animation_player.play("jump")
	if is_on_floor():
		Signalhub.plane_die.emit()
	move_and_slide()
