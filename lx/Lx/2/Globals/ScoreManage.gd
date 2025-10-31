extends Node

const SCORE_PATH = "user://tappy.tres"

func _ready() -> void:
	load_score()

var _high_score = 0
var high_score: int:
	get:
		return _high_score
	set(value):
		if value > _high_score:
			_high_score = value

func save_score():
	var hsr:High_Score = High_Score.new()
	hsr.high_score = high_score
	ResourceSaver.save(hsr,SCORE_PATH)

func load_score():
	if ResourceLoader.exists(SCORE_PATH):
		var hsr:High_Score = load(SCORE_PATH)
		if hsr:
			_high_score = hsr.high_score
