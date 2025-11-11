extends Resource

class_name LevelScoreResourse

const DEFALT_SCORE = 1000

@export var level_score: Dictionary[int,int]

func get_level_score(level:int):
	return level_score.get(level,DEFALT_SCORE)

func update_level_score(level:int ,score: int):
	var best = get_level_score(level)
	if best > score:
		level_score[level] = score

func level_exists(level: int):
	return level in level_score
