extends Node2D

@export var pokemon_name: String = "小火龙"
@export var level: int
@export var hp: int
@export var max_hp: int
@export var min_level: int = 5
@export var max_level: int = 100

var move_num = 0
var type: String
var _hp = 39
var _wg = 52
var _fy = 43
var _tg = 60
var _tf = 50
var _sd = 65
var _gtz = randi_range(0, 32)
var _move: Array

var move1 = 0
var move2 = 1
var move3 = 2
var move4 = 3

func _ready() -> void:
	level = randi_range(min_level, max_level)
	max_hp = int((_hp * 2 + _gtz) * level / 50 + level + 10)
	hp = max_hp
	if level >= 1:
		_move.append(PokemonMoveList.movelist[0].new())
		move_num += 1
		_move.append(PokemonMoveList.movelist[1].new())
		move_num += 1
	if level >= 4:
		_move.append(PokemonMoveList.movelist[2].new())
		move_num += 1
	if level >= 8:
		_move.append(PokemonMoveList.movelist[3].new())
		move_num += 1
	if level >= 12:
		_move.append(PokemonMoveList.movelist[4].new())
		move_num += 1
	if move_num > 4:
		move1 = randi_range(0, move_num - 1)
		move2 = randi_range(0, move_num - 1)
		move3 = randi_range(0, move_num - 1)
		move4 = randi_range(0, move_num - 1)
		while move1 == move2:
			move2 = randi_range(0, move_num - 1)
		while move1 == move3 or move2 == move3:
			move3 = randi_range(0, move_num - 1)
		while move1 == move4 or move2 == move4 or move3 == move4:
			move4 = randi_range(0, move_num - 1)
