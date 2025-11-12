extends Node

const FRAME_IMAGES: Array[Texture2D] = [
	preload("uid://ddugfdjoi4qvd"),
	preload("uid://dg7ohone2tuwp"),
	preload("uid://frtcai03efhs"),
	preload("uid://c4y1dihrew6aa")
]

var _image_list: Array[Texture2D]

func _enter_tree() -> void:
	var ifl: ImageFilesListResource = load("res://Resources/image_files_list.tres")
	for file in ifl.file_names:
		_image_list.append(load(file))

func get_random_item_image():
	return _image_list.pick_random()

func get_random_frame_image():
	return FRAME_IMAGES.pick_random()

func get_image(index: int):
	return _image_list[index]

func shuffle_images():
	_image_list.shuffle()
