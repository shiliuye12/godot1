extends Resource

class_name ScoreResource

const DEFAULT_SCORE: int = 1000

@export var level_score: Dictionary[String,int]

func get_level_best(level: String):
	return level_score.get(level,DEFAULT_SCORE)

func upgrate_level_score(level: String,score:int):
	var best:int = get_level_best(level)
	if best > score:
		level_score[level] = score
	
func level_exists(level: String):
	return level in level_score
