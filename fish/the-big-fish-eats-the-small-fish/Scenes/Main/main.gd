extends Control

func _ready() -> void:
	get_tree().paused = false

func _on_texture_button_pressed() -> void:
	ChangeScenes.change_to_choose_player()
