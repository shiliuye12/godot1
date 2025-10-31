extends Control

@onready var score: Label = $MarginContainer/score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = "%04d" % ScoreManage.high_score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		GameManager.lode_game()
