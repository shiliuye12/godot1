extends Node

const GAME = preload("uid://ccqxaf5fdxlkn")
const MAIN = preload("uid://cy1gxrpv8l0h7")

func lode_main():
	get_tree().change_scene_to_packed(MAIN)
	get_tree().paused = false

func lode_game():
	get_tree().change_scene_to_packed(GAME)
	get_tree().paused = false
