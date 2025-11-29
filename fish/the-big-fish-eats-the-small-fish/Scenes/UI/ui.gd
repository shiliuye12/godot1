extends CanvasLayer

@onready var score: Label = $MarginContainer/score
@onready var label: Label = $MarginContainer/GridContainer/Label
@onready var label_2: Label = $MarginContainer/GridContainer/Label2
@onready var label_3: Label = $MarginContainer/GridContainer/Label3
@onready var gmae_over: Label = $MarginContainer/GmaeOver
@onready var tg: Label = $MarginContainer/tg

var health: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HubSignal.on_score_up.connect(on_score_up)
	HubSignal.on_player_hurt.connect(on_player_hurt)

func on_score_up(_score: int):
	score.text = "分数：" + str(_score - 1)
	if _score >= 1500:
		tg.show()
		get_tree().paused = true

func on_player_hurt():
	health -= 1
	if health == 2:
		label.hide()
	elif health == 1:
		label_2.hide()
	elif health == 0:
		label_3.hide()
		gmae_over.show()
		get_tree().paused = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		ChangeScenes.change_to_main()
