extends Control

const GAME = preload("uid://d0fuyprwtoi5n")
const MAIN_2 = preload("uid://cy1gxrpv8l0h7")
const MAIN_3 = preload("uid://cefem2digvvti")
const MAIN_4 = preload("uid://crnn6n0tybv6y")

func _ready() -> void:
	get_tree().paused = false


func _on_1_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)

func _on_2_pressed() -> void:
	#get_tree().change_scene_to_packed(MAIN_2)
	get_tree().change_scene_to_file("res://2/Scences/Main/main.tscn")

func _on_3_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_3)

func _on_4_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_4)
