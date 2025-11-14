extends Object

class_name LevelDataSelector

const LEVEL_DATA: LevelDataResource = preload("uid://d1qw03noo852s")

static func get_level_setting(level: int):
	return LEVEL_DATA.get_level_data(level)
	
