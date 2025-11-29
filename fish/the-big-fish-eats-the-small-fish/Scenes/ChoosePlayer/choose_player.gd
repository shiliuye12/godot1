extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D/Sprite2D

const BLACK_BASS = preload("uid://dmmq0xh7unjcg")
const LARGE_MOUTH_BASS = preload("uid://b7wnlfmnnpd04")
const SPOTTED_BASS = preload("uid://cu0uhng7ghado")
const BLUEGILL_PANFISH = preload("uid://uxxr0pqbs0sf")

var arr: Array = []
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arr.append(BLACK_BASS)
	arr.append(LARGE_MOUTH_BASS)
	arr.append(SPOTTED_BASS)
	arr.append(BLUEGILL_PANFISH)


func _on_texture_button_pressed() -> void:
	if num == 3:
		num = 0
	else:
		num += 1
	sprite_2d.texture = arr[num]
	
func _on_texture_button_2_pressed() -> void:
	if num == 0:
		num = 3
	else:
		num -= 1
	sprite_2d.texture = arr[num]


func _on_texture_button_3_pressed() -> void:
	HubSignal.on_choose_player.emit(arr[num])
	ChangeScenes.change_to_level()
	
