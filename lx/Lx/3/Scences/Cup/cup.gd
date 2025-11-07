extends StaticBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimalSignalHub._on_cup_die.connect(on_cup_die)


func on_cup_die():
	animation_player.play("new_animation")
