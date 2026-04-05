extends Node

const MAIN = preload("uid://db0adscp66v8l")
const CRAFT_UI = preload("uid://bwst6d627c8hh")


func to_main():
	get_tree().change_scene_to_packed(MAIN)

func to_craft_ui():
	get_tree().change_scene_to_packed(CRAFT_UI)
