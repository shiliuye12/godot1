extends Node2D

const GEM = preload("uid://wt58bcudyp1u")
const PADDLE = preload("uid://c48rlurfb4ig8")
@onready var label: Label = $Label
@onready var spell: AudioStreamPlayer2D = $spell
@onready var gameover: AudioStreamPlayer2D = $gameover

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		ChangeScences.change_scencce()

func spawn_gem():
	var new_gem = GEM.instantiate()
	var new_x = randf_range(
		get_viewport_rect().position.x + 50,
		get_viewport_rect().end.x - 50
		)
	new_gem.position = Vector2(new_x,-50)
	add_child(new_gem)
	new_gem.gem_enter.connect(_gem_enter)
	new_gem.game_over.connect(_game_over)


func _on_timer_timeout() -> void:
	spawn_gem()

func _gem_enter():
	score += 1
	spell.play()
	label.text = "%04d" % score

func _game_over():
	gameover.play()
	get_tree().paused = true
