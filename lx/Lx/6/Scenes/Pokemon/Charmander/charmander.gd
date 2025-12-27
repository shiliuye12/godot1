extends Node2D

var id = 0

@export var pokemon_name: String = "小火龙"
@export var max_hp: int
@export var min_level: int = 5
@export var max_level: int = 100
var dq_dot_hh: int = 0
var dq_dot: String

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var level: int
var hp: int
var wg: int
var fy: int
var sd: int
var gtz = 0

var move_num = 0
var type: String = "火"
var type_2: String = "无"
var _hp = 39
var _wg = 52
var _fy = 43
var _sd = 65
var _move: Array
var dq_ex = 0.0

var move1 = 0
var move2 = 1
var move3 = 2
var move4 = 3
var move_number: Array
var move_pp: Array
var wz = PlayerData.dq_pokemon + 1

func _ready() -> void:
	dq_dot = ""
	dq_dot_hh = 0

func mx():
	sprite_2d.hide()
	sprite_2d_2.show()

func a_level(a: int, _gtz: int):
	level = a
	gtz = _gtz
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
	
	if move_num == 1:
		move_number.append(move1)
		move_pp.append(_move[0].pp)
	if move_num == 2:
		move_number.append(move1)
		move_number.append(move2)
		move_pp.append(_move[0].pp)
		move_pp.append(_move[1].pp)
	if move_num == 3:
		move_number.append(move1)
		move_number.append(move2)
		move_number.append(move3)
		move_pp.append(_move[0].pp)
		move_pp.append(_move[1].pp)
		move_pp.append(_move[2].pp)
	if move_num >= 4:
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
		move_pp.append(_move[move1].pp)
		move_pp.append(_move[move2].pp)
		move_pp.append(_move[move3].pp)
		move_pp.append(_move[move4].pp)
