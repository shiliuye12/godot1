extends Node

const LEVEL = preload("uid://vv5nwmnwe0pp")
const MAIN = preload("uid://bwrsnnpbjnuxc")
const CHOOSE_PLAYER = preload("uid://f0eo7oqpp1e5")

var x: Texture

func change_to_level():
	get_tree().change_scene_to_packed(LEVEL)

func change_to_main():
	get_tree().change_scene_to_packed(MAIN)

func change_to_choose_player():
	get_tree().change_scene_to_packed(CHOOSE_PLAYER)

func _ready() -> void:
	HubSignal.on_choose_player.connect(on_choose_player)

func on_choose_player(a: Texture):
	x = a
