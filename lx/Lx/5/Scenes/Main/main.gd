extends Control

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://main/Main/control.tscn")

func _on_button_pressed() -> void:
	GoldChooseLevel.new_level()
