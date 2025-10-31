extends Node

const GAME = preload("uid://ccqxaf5fdxlkn")
const MAIN = preload("uid://cy1gxrpv8l0h7")
const LOAD = preload("uid://037xglu0icck")

var next_scene : PackedScene

func add_scene():
	var ct = LOAD.instantiate()
	add_child(ct)

func lode_main():
	next_scene = MAIN
	add_scene()

func lode_game():
	next_scene = GAME
	add_scene()
