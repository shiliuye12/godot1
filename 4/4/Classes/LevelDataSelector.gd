extends Object

class_name LevelDataSelector

const LEVEL_DATA: LevelDataResource = preload("uid://d1qw03noo852s")

var _selected_images: Array[Texture2D]
var _level_setting: LevelSettingResource

func _init(level_setting: LevelSettingResource, selected_images: Array[Texture2D]) -> void:
	_level_setting = level_setting
	_selected_images = selected_images

static func get_level_setting(level: int):
	return LEVEL_DATA.get_level_data(level)
	
static func get_level_selector(level_num: int):
	var level_setting: LevelSettingResource = get_level_setting(level_num)
	
	if level_setting == null:
		return
	
	ImageManager.shuffle_images()
	var selected_images: Array[Texture2D]
	for i in range(level_setting.get_target_pairs()):
		selected_images.append(ImageManager.get_image(i))
		selected_images.append(ImageManager.get_image(i))
	
	selected_images.shuffle()
	
	return LevelDataSelector.new(level_setting, selected_images)
	
func get_selected_images():
	return _selected_images

func get_target_pairs():
	return _level_setting.get_target_pairs()

func get_num_cols():
	return _level_setting.get_cols()
