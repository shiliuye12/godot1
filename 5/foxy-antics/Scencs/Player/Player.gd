extends CharacterBody2D

class_name Player

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var shooter: Shooter = $Shooter
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var hurt_timer: Timer = $HurtTimer
@onready var player_cam: Camera2D = $PlayerCam

@export var fell_off_y = 400
@export var lives: int = 3
@export var camera_min: Vector2 = Vector2(-10000, 10000)
@export var camera_max: Vector2 = Vector2(10000, -10000)

const GRAVITY = 690.0
const JUMP_SPEED = -270
const RUN_SPEED = 120
const MAX_FALL = 350
const HURT_JUMP_VELOCITY = Vector2(0, -130)
const DAMAGE = preload("uid://iyymqdtt7lcc")
const JUMP = preload("uid://bn4inkecbwsh2")

var _is_hurt: bool = false
var _invincible: bool = false

func play_effect(effect: AudioStream):
	sound.stop()
	sound.stream = effect
	sound.play()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var dir: Vector2 = Vector2.LEFT if sprite_2d.flip_h else Vector2.RIGHT
		shooter.shoot(dir)

func _ready() -> void:
	set_camera_limits()
	call_deferred("late_init")

func _enter_tree() -> void:
	add_to_group(Constants.PLAYER_GROUP)

func late_init():
	SignalHub.on_player_hit.emit(lives, false)

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	get_input()
	
	velocity.y = clampf(velocity.y, JUMP_SPEED, MAX_FALL)
	
	move_and_slide()
	up_label()
	fallen_off()

func set_camera_limits():
	player_cam.limit_bottom = camera_min.y
	player_cam.limit_left = camera_min.x
	player_cam.limit_top = camera_max.y
	player_cam.limit_right = camera_max.x
	

func get_input():
	if _is_hurt == true:
		return
		
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
		play_effect(JUMP)
	
	velocity.x = RUN_SPEED * Input.get_axis("left", "right")

	if velocity.x < 0:
		sprite_2d.flip_h = true
	elif velocity.x > 0:
		sprite_2d.flip_h = false

func fallen_off():
	if global_position.y < fell_off_y:
		return
	reduce_lives(lives)

func up_label():
	var ds:String
	ds += "Floor:%s LV:%d\n" % [is_on_floor(), lives]
	ds += "V:%.1f,%.1f\n" % [velocity.x, velocity.y]
	ds += "P:%.1f,%.1f" % [global_position.x, global_position.y]
	label.text = ds

func go_invincible():
	if _invincible == true:
		return 0
	_invincible = true
	var tween: Tween = create_tween()
	for i in range(3):
		tween.tween_property(sprite_2d, "modulate", Color("#ffffff", 0.0), 0.5)
		tween.tween_property(sprite_2d, "modulate", Color("#ffffff", 1.0), 0.5)
	tween.tween_property(self, "_invincible", false, 0)

func apply_hurt_jump():
	_is_hurt = true
	velocity = HURT_JUMP_VELOCITY
	hurt_timer.start()
	play_effect(DAMAGE)

func apply_hit():
	if _invincible == true:
		return 0
	if reduce_lives(1) == false:
		return
	go_invincible()
	apply_hurt_jump()

func reduce_lives(reduction: int):
	lives -= reduction
	SignalHub.on_player_hit.emit(lives, true)
	if lives <= 0:
		set_physics_process(false)
		return false
	return true

func _on_hit_box_area_entered(_area: Area2D) -> void:
	call_deferred("apply_hit")


func _on_hurt_timer_timeout() -> void:
	_is_hurt = false
