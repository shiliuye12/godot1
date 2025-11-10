extends StaticBody2D

class_name Cup

@onready var animation_player: AnimationPlayer = $AnimationPlayer
static var cup_number: int =0

func _ready() -> void:
	AnimalSignalHub._on_cup_die.connect(on_cup_die)
	cup_number += 1


func on_cup_die():
	cup_number -= 1
	animation_player.play("new_animation")
