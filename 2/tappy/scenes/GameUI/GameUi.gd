extends Control

const GAME_OVER = preload("uid://wjnyhwhbyrd")

@onready var press: Label = $MarginContainer/press
@onready var gameover: Label = $gameover
@onready var timer: Timer = $Timer
@onready var scorelable: Label = $MarginContainer/score
@onready var sound: AudioStreamPlayer = $Sound

var score

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") == true and gameover.visible == false:
		GameManage.load_main_scenes()

func _ready() -> void:
	press.visible = false
	gameover.visible = false
	score = 0
	scorelable.text = "%04d" % score

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_on_plane_died)
	SignalHub.on_point_score.connect(on_point_score)

func _on_plane_on_plane_died():
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	timer.start()
	ScoreManage.high_score = score
	gameover.visible = true


func _on_timer_timeout() -> void:
	gameover.visible = false
	press.visible = true

func on_point_score():
	sound.play()
	score += 1
	scorelable.text = "%04d" % score
