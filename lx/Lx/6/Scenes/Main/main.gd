extends Control

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_qd"):
		PokemonScenesChoose.to_choose_pokemon()
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://main/Main/control.tscn")
