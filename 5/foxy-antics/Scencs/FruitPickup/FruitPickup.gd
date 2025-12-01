extends Area2D

@export var points: int = 2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $Sound

func _ready() -> void:
	var ln: Array[String] = []
	for an_name in animated_sprite_2d.sprite_frames.get_animation_names():
		ln.push_back(an_name)
	animated_sprite_2d.animation = ln.pick_random()
	animated_sprite_2d.play()


func _on_area_entered(area: Area2D) -> void:
	hide()
	set_deferred("monitoring", false)
	sound.play()
	SignalHub.on_scored.emit(points)


func _on_sound_finished() -> void:
	queue_free()
