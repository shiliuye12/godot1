extends Node

var level_pass = 2
var tg = 0

signal on_grapple_position(_position: Vector2)
signal on_daoda
signal on_score(score: int)
signal on_level_pass(a: bool)
signal on_save_score(score: int)
signal on_text(text: String)
signal on_bomb
