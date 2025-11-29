extends CharacterBody2D

class_name Player

const SPEED: int = 3200

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var score: int = 1
var health: int = 3
var is_hurt: bool = false

func _ready() -> void:
	HubSignal.on_player_hurt.connect(on_player_hurt)
	sprite_2d.texture = ChangeScenes.x
	position = Vector2(288, 162)

func _physics_process(delta: float) -> void:
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		sprite_2d.rotation = deg_to_rad(0)
		sprite_2d.flip_h = false
		sprite_2d.rotation = deg_to_rad(-45)
		velocity.x = -SPEED * delta
	if Input.is_action_pressed("right"):
		sprite_2d.rotation = deg_to_rad(0)
		sprite_2d.flip_h = true
		sprite_2d.rotation = deg_to_rad(45)
		velocity.x = SPEED * delta
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED * delta
	if Input.is_action_pressed("down"):
		velocity.y = SPEED * delta
	
	self.scale.x = 1 + score * 0.01
	self.scale.y = 1 + score * 0.01
	
	
	move_and_slide()

func on_player_hurt():
	health -= 1
	timer.start()
	is_hurt = true
	animation_player.play("new_animation")


func _on_timer_timeout() -> void:
	is_hurt = false
