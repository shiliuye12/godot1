extends Node

const POKEMON_VS = preload("uid://dukawurxb2cox")
const JL = preload("uid://qg16urfxu76h")
const SHOP = preload("uid://c50starfi3mmv")

func to_pokemon_vs():
	get_tree().change_scene_to_packed(POKEMON_VS)

func to_jl():
	get_tree().change_scene_to_packed(JL)

func to_shop():
	get_tree().change_scene_to_packed(SHOP)
