extends Node

const SCORE_PATH: String = "user://tappy.tres"

var _high_score: int = 0
var high_score: int :
	get:
		return _high_score
	set(value):
		if _high_score < value:
			_high_score = value
			save_high_score()

func _ready() -> void:
	load_high_score()

func load_high_score():
	if ResourceLoader.exists(SCORE_PATH):
		var hsr: HighScoreResource = load(SCORE_PATH)
		if hsr:
			_high_score = hsr.high_score

func save_high_score():
	var hsr:HighScoreResource = HighScoreResource.new()
	hsr.high_score = _high_score
	ResourceSaver.save(hsr , SCORE_PATH)
