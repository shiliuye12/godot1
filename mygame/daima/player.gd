extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#读取玩家输入，左是-1，右是1，无是0 
	var direction := Input.get_axis("left", "right")
	
	#翻转动画
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#播放玩家动画
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("daiji")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	#执行移动操作
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
