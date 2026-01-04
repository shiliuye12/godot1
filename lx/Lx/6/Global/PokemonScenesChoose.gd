extends Node

const POKEMON_VS = preload("uid://dukawurxb2cox")
const JL = preload("uid://qg16urfxu76h")
const SHOP = preload("uid://c50starfi3mmv")
const BB = preload("uid://bjtea7ulhngtk")
const XX_POKEMON_BB = preload("uid://byc1b2qkel8os")
const MOVE = preload("uid://b85iufgcbi56u")
const GAME_OVER = preload("uid://crnw4pgdaaktf")
const MAIN = preload("uid://ffik1juy20ki")
const CHOOSE_POKEMON = preload("uid://birx1nwa5nhip")

var in_xx = false
var in_xx_wz = 0

func to_pokemon_vs():
	get_tree().change_scene_to_packed(POKEMON_VS)

func to_jl():
	get_tree().change_scene_to_packed(JL)

func to_shop():
	get_tree().change_scene_to_packed(SHOP)

func to_bb():
	get_tree().change_scene_to_packed(BB)

func to_xx_pokemon_bb():
	get_tree().change_scene_to_packed(XX_POKEMON_BB)

func to_move():
	get_tree().change_scene_to_packed(MOVE)

func to_game_over():
	get_tree().change_scene_to_packed(GAME_OVER)

func to_main():
	get_tree().change_scene_to_packed(MAIN)

func to_choose_pokemon():
	get_tree().change_scene_to_packed(CHOOSE_POKEMON)
