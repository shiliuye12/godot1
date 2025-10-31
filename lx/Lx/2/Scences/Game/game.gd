extends Node2D

const PIPES = preload("uid://dcixd5bejbrph")
@onready var game_over: AudioStreamPlayer2D = $Plane/game_over

func _ready() -> void:
	get_tree().paused = false
	spanw_pipes()
	Signalhub.plane_die.connect(_plane_die)

func spanw_pipes():
	var new_pipes = PIPES.instantiate()
	var new_y = randf_range(
		get_viewport_rect().position.y + 200,
		get_viewport_rect().end.y - 200
	)
	new_pipes.position = Vector2(get_viewport_rect().end.x + 100,new_y)
	add_child(new_pipes)


func _on_timer_timeout() -> void:
	spanw_pipes()

func _plane_die():
	game_over.play()
	get_tree().paused = true
