extends Node

const PATH = "user://animals.tres"

var _level_score: LevelScoreResourse

var level_a:int :
	get:
		return level_a
	set(value):
		level_a = value

var level_score:int :
	get:
		return level_score
	set(value):
		if value == 0:
			level_score = 0
		else:
			level_score += 1

func _ready() -> void:
	load_score()

func load_score():
	if ResourceLoader.exists(PATH) == true:
		_level_score = load(PATH)
	else:
		_level_score = LevelScoreResourse.new()

func save_score():
	ResourceSaver.save(_level_score, PATH)

func set_score(level: int, score: int):
	_level_score.update_level_score(level, score)
	save_score()
