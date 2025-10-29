extends Node2D

const speed = 60
var fangxiang : int = 1
@onready var right: RayCast2D = $right
@onready var left: RayCast2D = $left
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if right.is_colliding():
		animated_sprite.flip_h = true
		fangxiang = -1
	if left.is_colliding():
		animated_sprite.flip_h = false
		fangxiang = 1
	position.x += fangxiang * speed * delta
