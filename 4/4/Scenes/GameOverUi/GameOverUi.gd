extends Control

@onready var moves_label: Label = $NinePatchRect/VBoxContainer/MovesLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_over.connect(_on_game_over)
	SignalHub.on_game_exit_pressed.connect(_on_game_exit_pressed)


func _on_game_over(moves_taken: int):
	moves_label.text = "You took %d moves" % moves_taken
	show()

func _on_game_exit_pressed():
	hide()
