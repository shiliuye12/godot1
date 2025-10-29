extends CharacterBody2D

class_name Tappy

var _gravity = 980.0
const jump = -400
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound

func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	
	if is_on_floor():
		die()

func fly(delta: float):
	velocity.y += _gravity *delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump
		animation_player.play("jump")
	

func die():
	engine_sound.stop()
	animated_sprite_2d.stop()
	set_physics_process(false)
	SignalHub.on_plane_died.emit()
