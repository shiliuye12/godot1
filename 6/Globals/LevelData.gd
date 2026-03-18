extends Node

const LEVEL_DATA_PATH: String = "res://Data/002 level_data.json"

var _level_data: Dictionary = {}

func _enter_tree() -> void:
	load_level_data()

func load_level_data():
	var file: FileAccess = FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
	
	if !file:
		return
	
	var json_data: Dictionary = JSON.parse_string(file.get_as_text())
	for ln in json_data.keys():
		var level_data = json_data[ln]
		pass
