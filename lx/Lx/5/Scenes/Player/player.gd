extends CharacterBody2D

@onready var grapple: Area2D = $grapple
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var tween: Tween = create_tween()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween_play() 

func tween_play():
	tween.set_loops()
	tween.tween_property(grapple, "rotation_degrees", 70.0, 2)
	tween.tween_property(grapple, "rotation_degrees", -70.0, 2)

func _process(delta: float) -> void:
	if grapple._can_fs == false:
		tween.pause()
		animated_sprite_2d.play("default")
	else:
		tween.play()
		animated_sprite_2d.stop()
