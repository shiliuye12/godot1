extends Node

const POKEMON_VS = preload("uid://dukawurxb2cox")

func to_pokemon_vs():
	get_tree().change_scene_to_packed(POKEMON_VS)
