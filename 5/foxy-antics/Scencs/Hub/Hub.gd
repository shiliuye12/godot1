extends Control

const YOU_WIN = preload("uid://ti83lgcsshb8")
const GAME_OVER = preload("uid://bnuevcljeytfg")

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var hb_hearts: HBoxContainer = $MarginContainer/HBHearts
@onready var color_rect: ColorRect = $ColorRect
@onready var v_game_over: VBoxContainer = $ColorRect/VGameOver
@onready var v_complete: VBoxContainer = $ColorRect/VComplete
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $Sound

var _score = 0
var _hearts: Array
var _can_continue = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.load_main()
	if _can_continue and event.is_action_pressed("next"):
		GameManager.load_next_level()
	if _can_continue and event.is_action_pressed("reload"):
		GameManager.load_main()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hearts = hb_hearts.get_children()
	_score = GameManager.cached_score
	on_scored(0)

func _exit_tree() -> void:
	GameManager.try_add_new_score(_score)

func _enter_tree() -> void:
	SignalHub.on_scored.connect(on_scored)
	SignalHub.on_player_hit.connect(on_player_hit)
	SignalHub.on_level_complete.connect(on_level_complete)

func on_scored(points: int):
	_score += points
	score_label.text = "%05d" % _score

func on_player_hit(lives: int, shake: bool):
	for index in range(_hearts.size()):
		_hearts[index].visible = lives > index
	if lives <= 0:
		on_level_complete(false)

func on_level_complete(complete: bool):
	color_rect.show()
	if complete:
		v_complete.show()
		sound.stream = YOU_WIN
	else:
		v_game_over.show()
		sound.stream = GAME_OVER
	sound.play()
	get_tree().paused = true
	timer.start()


func _on_timer_timeout() -> void:
	_can_continue = true
