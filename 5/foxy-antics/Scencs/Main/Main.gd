extends Control

@onready var grid_container: GridContainer = $MarginContainer/GridContainer
const HIGH_SCORE_DISPLAY = preload("uid://bnrhherjymhqw")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		GameManager.load_next_level()

func set_scores():
	for score: HighScore in GameManager.high_scores.get_scores_list():
		var hsd: HighScoreDisplayItem = HIGH_SCORE_DISPLAY.instantiate()
		hsd.set_up(score)
		grid_container.add_child(hsd)

func _ready() -> void:
	get_tree().paused = false
	set_scores()
