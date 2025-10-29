extends Control

const GAME = preload("uid://cswcwrs0x5hhp")
@onready var label: Label = $MarginContainer/Label

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") == true:
		GameManage.load_game_scenes()

func _ready() -> void:
	get_tree().paused = false
	label.text = "%04d" % ScoreManage.high_score
