extends Node2D

@export var pokemon_name: String = "小火龙"
@export var max_hp: int
@export var min_level: int = 5
@export var max_level: int = 100

var level: int
var hp: int
var wg: int
var fy: int
var sd: int

var move_num = 0
var type: String = "火"
var _hp = 39
var _wg = 52
var _fy = 43
var _sd = 65
var _gtz = randi_range(0, 32)
var _move: Array

var move1 = 0
var move2 = 1
var move3 = 2
var move4 = 3
var move_number: Array

func _ready() -> void:
	level = randi_range(min_level, max_level)
	max_hp = int((_hp * 2 + _gtz) * level / 50 + level + 10)
	hp = max_hp
	wg = int((_wg * 2 + _gtz ) * level / 50 + 10)
	fy = int((_fy * 2 + _gtz ) * level / 50 + 10)
	sd = int((_sd * 2 + _gtz ) * level / 50 + 10)
	
	if level >= 1:
		_move.append(PokemonMoveList.charmander_movelist[0].new())
		move_num += 1
		_move.append(PokemonMoveList.charmander_movelist[1].new())
		move_num += 1
	if level >= 4:
		_move.append(PokemonMoveList.charmander_movelist[2].new())
		move_num += 1
	if level >= 8:
		_move.append(PokemonMoveList.charmander_movelist[3].new())
		move_num += 1
	if level >= 12:
		_move.append(PokemonMoveList.charmander_movelist[4].new())
		move_num += 1
	
	if move_num <= 1:
		move_number.append(move1)
	if move_num <= 2:
		move_number.append(move1)
		move_number.append(move2)
	if move_num <= 3:
		move_number.append(move1)
		move_number.append(move2)
		move_number.append(move3)
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
		move_number.append(move1)
		move_number.append(move2)
		move_number.append(move3)
		move_number.append(move4)
