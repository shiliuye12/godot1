extends Node

const LEVEL_1 = preload("uid://dva16wa7jlcls")
const LEVEL_2 = preload("uid://cicr5aqoyvqne")
const SHOP = preload("uid://b1tvwvc0e2gct")
const MAIN = preload("uid://dbx00yseeje8i")
const ZHUANCHANG = preload("uid://t72wbrexpwu5")
const LEVEL_3 = preload("uid://bwf4qxwcjj8mu")

var level_1_score = 650
var level_2_score = 1250
var level_3_score = 2500

var dq_level: int = 0:
	get:
		return dq_level
	set(a):
		dq_level = a
var level: Array = [LEVEL_1, LEVEL_2, LEVEL_3]
var level_score: Array = [level_1_score, level_2_score, level_3_score]
var mb_score = level_score[dq_level - 1]
var score = 0
var bomb_num = 0
var book_num = 0
var luck_num = 0
var water_num = 0

func _enter_tree() -> void:
	GoldSignalHub.on_save_score.connect(on_save_score)

func on_save_score(_score):
	score = _score

func new_level():
	get_tree().change_scene_to_packed(level[dq_level])
	dq_level += 1
	mb_score = level_score[dq_level - 1]

	
func to_shop():
	water_num = 0
	get_tree().change_scene_to_packed(SHOP)

func to_main():
	water_num = 0
	bomb_num = 0
	book_num = 0
	luck_num = 0
	score = 0
	dq_level = 0
	get_tree().change_scene_to_packed(MAIN)

func to_zhuanchang():
	get_tree().change_scene_to_packed(ZHUANCHANG)
