extends Node

const MAIN = preload("uid://bepqopbrmymx5")
const LEVEL_BASE = preload("uid://cu0oqx2ytpjwe")

const SCORES_PATH = "user://high_scores.tres"

var high_scores: HighScores = HighScores.new()

var cached_score: int:
	set(value):
		cached_score = value
	get:
		return cached_score

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()

func _ready() -> void:
	load_high_scores()

func _exit_tree() -> void:
	save_high_scores()

func load_main():
	cached_score = 0
	get_tree().change_scene_to_packed(MAIN)

func load_next_level():
	get_tree().change_scene_to_packed(LEVEL_BASE)

func load_high_scores():
	if ResourceLoader.exists(SCORES_PATH):
		high_scores = load(SCORES_PATH)

func save_high_scores():
	ResourceSaver.save(high_scores, SCORES_PATH)

func try_add_new_score(score: int):
	high_scores.add_new_score(score)
	save_high_scores()
	cached_score = score
