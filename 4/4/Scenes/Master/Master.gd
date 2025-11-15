extends Control

@onready var music: AudioStreamPlayer = $Music
@onready var main: Control = $Main
@onready var game: Control = $Game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var set = LevelDataSelector.get_level_setting(6)
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	SignalHub.on_level_selected.connect(_on_level_selected)
	SignalHub.on_game_exit_pressed.connect(_on_game_exit_pressed)

func show_game(s: bool):
	main.visible = !s
	game.visible = s

func _on_level_selected(level_num: int):
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)
	show_game(true)

func _on_game_exit_pressed():
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	show_game(false)
