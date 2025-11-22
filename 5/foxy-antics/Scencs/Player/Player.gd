extends CharacterBody2D

class_name Player

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label: Label = $Label

@export var fell_off_y = 400

const GRAVITY = 690.0
const JUMP_SPEED = -270
const RUN_SPEED = 120
const MAX_FALL = 350

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _enter_tree() -> void:
	add_to_group(Constants.PLAYER_GROUP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
	
	velocity.x = RUN_SPEED * Input.get_axis("left", "right")

	if velocity.x < 0:
		sprite_2d.flip_h = true
	elif velocity.x > 0:
		sprite_2d.flip_h = false
	
	velocity.y = clampf(velocity.y, JUMP_SPEED, MAX_FALL)
	
	move_and_slide()
	up_label()
	fallen_off()

func fallen_off():
	if global_position.y > fell_off_y:
		queue_free()

func up_label():
	var ds:String
	ds += "Floor:%s\n" % [is_on_floor()]
	ds += "V:%.1f,%.1f\n" % [velocity.x, velocity.y]
	ds += "P:%.1f,%.1f" % [global_position.x, global_position.y]
	label.text = ds
