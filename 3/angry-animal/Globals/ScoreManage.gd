extends Node

const SCORE_PATH = "user://animals.tres"

var _level_score: ScoreResource

var level_number: String = "1":
	get():
		return level_number
	set(value):
		level_number = value

func _ready() -> void:
	load_score()

func load_score():
	if ResourceLoader.exists(SCORE_PATH):
		_level_score = load(SCORE_PATH)
	if !_level_score:
		_level_score = ScoreResource.new()

func save_score():
	ResourceSaver.save(_level_score,SCORE_PATH)

func get_level_best(level: String):
	return _level_score.get_level_best(level)

func set_score(level: String, score: int):
	_level_score.upgrate_level_score(level,score)
	save_score()
