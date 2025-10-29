extends Node

const MAIN = preload("uid://bh7mvwlxwtlma")
const GAME = preload("uid://cswcwrs0x5hhp")
const SIMPLE_TRANSITION = preload("uid://cx6ewcyjd7iex")
const COMPLEX_TRANSITION = preload("uid://blgla8aaj3pii")

var next_scene:PackedScene

func add_complex():
	var ct = COMPLEX_TRANSITION.instantiate()
	add_child(ct)

func load_game_scenes():
	next_scene = GAME
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
func load_main_scenes():
	next_scene = MAIN
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
