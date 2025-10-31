extends Control

@onready var game_over: Label = $GameOver
@onready var pause: Label = $Pause
@onready var score: Label = $MarginContainer/score

var _score = 0

func _enter_tree() -> void:
	Signalhub.plane_die.connect(_die)
	Signalhub._score.connect(add_score)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit") and game_over.visible == false:
		GameManager.lode_main()
		pause.visible = false

func _die():
	game_over.visible = true
	await get_tree().create_timer(1).timeout
	game_over.visible = false
	pause.visible = true

func add_score():
	_score += 1
	score.text = "%04d" % _score
	ScoreManage.high_score = _score
	ScoreManage.save_score()
