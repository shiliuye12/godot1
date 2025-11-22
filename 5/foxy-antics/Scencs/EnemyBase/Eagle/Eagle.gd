extends EnemyBase

@export var fly_speed_R = Vector2(35,15)
@export var fly_speed_L = Vector2(-35,15)

var _fly_direction = Vector2.ZERO

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity = _fly_direction
	move_and_slide()
	if ray_cast_2d.is_colliding() == true:
		shoot()

func shoot():
	print("shoot")

func fly_to_player():
	animated_sprite_2d.flip_h = _player_ref.position.x > global_position.x

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	fly_to_player()
	_fly_direction = fly_speed_R if animated_sprite_2d.flip_h == true else fly_speed_L
