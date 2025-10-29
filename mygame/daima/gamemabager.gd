extends Node

var score : int = 0
@onready var score_label: Label = $score_label

func add_point():
	score += 1
	score_label.text = "金币数量：" + str(score)
