extends Control

@onready var p_type: Label = $ColorRect2/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/p_type
@onready var p_power: Label = $ColorRect2/ColorRect/MarginContainer/VBoxContainer/HBoxContainer2/p_power
@onready var p_jt_1: TextureRect = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer/p_jt1
@onready var p_move_1: Label = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer/p_move1
@onready var p_jt_2: TextureRect = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer2/p_jt2
@onready var p_move_2: Label = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer2/p_move2
@onready var p_jt_3: TextureRect = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer3/p_jt3
@onready var p_move_3: Label = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer3/p_move3
@onready var p_jt_4: TextureRect = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer4/p_jt4
@onready var p_move_4: Label = $ColorRect2/MarginContainer/VBoxContainer/HBoxContainer4/p_move4
@onready var type: Label = $ColorRect3/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/type
@onready var power: Label = $ColorRect3/ColorRect/MarginContainer/VBoxContainer/HBoxContainer2/power
@onready var jt_1: TextureRect = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer/jt1
@onready var move_1: Label = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer/move1
@onready var jt_2: TextureRect = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer2/jt2
@onready var move_2: Label = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer2/move2
@onready var jt_3: TextureRect = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer3/jt3
@onready var move_3: Label = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer3/move3
@onready var jt_4: TextureRect = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer4/jt4
@onready var move_4: Label = $ColorRect3/MarginContainer/VBoxContainer/HBoxContainer4/move4

var p_wz = 1
var wz = 1
var p_move = true
var player_pokemon_data = PlayerData.pokemon_load(PokemonScenesChoose.in_xx_wz + 1)
var player_pokemon = PokemonManager.Pokemon_instantiate(player_pokemon_data["id"])
var player_move: Array
var ys: int = 1

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit") and p_move:
		PokemonScenesChoose.to_xx_pokemon_bb()
	if event.is_action_pressed("pokemon_down") and p_wz < 4 and p_move:
		p_wz += 1
	if event.is_action_pressed("pokemon_up") and p_wz > 1 and p_move:
		p_wz -= 1
	if event.is_action_pressed("pokemon_qd") and p_type.text != "-" and p_move:
		p_move = false
		p_jt_1.hide()
		p_jt_2.hide()
		p_jt_3.hide()
		p_jt_4.hide()
		wz = 1
	elif event.is_action_pressed("pokemon_qd") and !p_move and type.text != "-":
		if gh_move() == 0:
			p_move = true
			jt_1.hide()
			jt_2.hide()
			jt_3.hide()
			jt_4.hide()
			p_wz = 1
	if event.is_action_pressed("pokemon_down") and wz < 4 and !p_move:
		wz += 1
	if event.is_action_pressed("pokemon_up") and wz > 1 and !p_move:
		wz -= 1
	if !p_move and event.is_action_pressed("pokemon_left") and ys > 1:
		ys -= 1
	if !p_move and event.is_action_pressed("pokemon_right") and ys < 5:
		ys += 1
	if event.is_action_pressed("exit") and !p_move:
		p_move = true
		p_wz = 1
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()

func _ready() -> void:
	player_pokemon.a_level(player_pokemon_data["level"], player_pokemon_data["gtz"])
	player_move = player_pokemon._move
	player_pokemon.move1 = player_pokemon_data["move"][0]
	player_pokemon.move_pp = player_pokemon_data["move_pp"]
	player_pokemon.wz = player_pokemon_data["wz"]
	p_move_1.text = player_pokemon._move[player_pokemon.move1].name
	if player_pokemon.move_num > 1:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		p_move_2.text = player_pokemon._move[player_pokemon.move2].name
	if player_pokemon.move_num > 2:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2]
		p_move_3.text = player_pokemon._move[player_pokemon.move3].name
	if player_pokemon.move_num > 3:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2]
		player_pokemon.move4 = player_pokemon_data["move"][3]
		p_move_4.text = player_pokemon._move[player_pokemon.move4].name
	player_pokemon.move_number.clear()
	player_pokemon.move_number = player_pokemon_data["move"]
	player_pokemon.move_pp = player_pokemon_data["move_pp"]

func _process(_delta: float) -> void:
	if ys == 1:
		if player_pokemon._move.size() >= 1:
			move_1.text = player_pokemon._move[0].name
		else:
			move_1.text = "------"
		if player_pokemon._move.size() >= 2:
			move_2.text = player_pokemon._move[1].name
		else:
			move_2.text = "------"
		if player_pokemon._move.size() >= 3:
			move_3.text = player_pokemon._move[2].name
		else:
			move_3.text = "------"
		if player_pokemon._move.size() >= 4:
			move_4.text = player_pokemon._move[3].name
		else:
			move_4.text = "------"
	if ys == 2:
		if player_pokemon._move.size() >= 5:
			move_1.text = player_pokemon._move[4].name
		else:
			move_1.text = "------"
		if player_pokemon._move.size() >= 6:
			move_2.text = player_pokemon._move[5].name
		else:
			move_2.text = "------"
		if player_pokemon._move.size() >= 7:
			move_3.text = player_pokemon._move[6].name
		else:
			move_3.text = "------"
		if player_pokemon._move.size() >= 8:
			move_4.text = player_pokemon._move[7].name
		else:
			move_4.text = "------"
	if ys == 3:
		if player_pokemon._move.size() >= 9:
			move_1.text = player_pokemon._move[8].name
		else:
			move_1.text = "------"
		if player_pokemon._move.size() >= 10:
			move_2.text = player_pokemon._move[9].name
		else:
			move_2.text = "------"
		if player_pokemon._move.size() >= 11:
			move_3.text = player_pokemon._move[10].name
		else:
			move_3.text = "------"
		if player_pokemon._move.size() >= 12:
			move_4.text = player_pokemon._move[11].name
		else:
			move_4.text = "------"
	if ys == 4:
		if player_pokemon._move.size() >= 13:
			move_1.text = player_pokemon._move[12].name
		else:
			move_1.text = "------"
		if player_pokemon._move.size() >= 14:
			move_2.text = player_pokemon._move[13].name
		else:
			move_2.text = "------"
		if player_pokemon._move.size() >= 15:
			move_3.text = player_pokemon._move[14].name
		else:
			move_3.text = "------"
		if player_pokemon._move.size() >= 16:
			move_4.text = player_pokemon._move[15].name
		else:
			move_4.text = "------"
	if ys == 5:
		if player_pokemon._move.size() >= 17:
			move_1.text = player_pokemon._move[16].name
		else:
			move_1.text = "------"
		if player_pokemon._move.size() >= 18:
			move_2.text = player_pokemon._move[17].name
		else:
			move_2.text = "------"
		if player_pokemon._move.size() >= 19:
			move_3.text = player_pokemon._move[18].name
		else:
			move_3.text = "------"
		if player_pokemon._move.size() >= 20:
			move_4.text = player_pokemon._move[19].name
		else:
			move_4.text = "------"
	if p_wz == 1 and p_move:
		p_jt_1.show()
		p_jt_2.hide()
		p_jt_3.hide()
		p_jt_4.hide()
		if player_pokemon.move_num >= 1:
			p_type.text = player_pokemon._move[player_pokemon.move1].type
			p_power.text = str(player_pokemon._move[player_pokemon.move1].power)
		else:
			p_type.text = "-"
			p_power.text = "-"
	if p_wz == 2 and p_move:
		p_jt_1.hide()
		p_jt_2.show()
		p_jt_3.hide()
		p_jt_4.hide()
		if player_pokemon.move_num >= 2:
			p_type.text = player_pokemon._move[player_pokemon.move2].type
			p_power.text = str(player_pokemon._move[player_pokemon.move2].power)
		else:
			p_type.text = "-"
			p_power.text = "-"
	if p_wz == 3 and p_move:
		p_jt_1.hide()
		p_jt_2.hide()
		p_jt_3.show()
		p_jt_4.hide()
		if player_pokemon.move_num >= 3:
			p_type.text = player_pokemon._move[player_pokemon.move3].type
			p_power.text = str(player_pokemon._move[player_pokemon.move3].power)
		else:
			p_type.text = "-"
			p_power.text = "-"
	if p_wz == 4 and p_move:
		p_jt_1.hide()
		p_jt_2.hide()
		p_jt_3.hide()
		p_jt_4.show()
		if player_pokemon.move_num >= 4:
			p_type.text = player_pokemon._move[player_pokemon.move4].type
			p_power.text = str(player_pokemon._move[player_pokemon.move4].power)
		else:
			p_type.text = "-"
			p_power.text = "-"
	
	if wz == 1 and !p_move:
		jt_1.show()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		if player_move.size() >= 1 and ys == 1:
			move_1.text = player_move[0].name
			type.text = player_move[0].type
			power.text = str(player_move[0].power)
		elif player_move.size() >= 5 and ys == 2:
			move_1.text = player_move[4].name
			type.text = player_move[4].type
			power.text = str(player_move[4].power)
		elif player_move.size() >= 9 and ys == 3:
			move_1.text = player_move[8].name
			type.text = player_move[8].type
			power.text = str(player_move[8].power)
		elif player_move.size() >= 13 and ys == 4:
			move_1.text = player_move[12].name
			type.text = player_move[12].type
			power.text = str(player_move[12].power)
		elif player_move.size() >= 17 and ys == 5:
			move_1.text = player_move[16].name
			type.text = player_move[16].type
			power.text = str(player_move[16].power)
		else:
			move_1.text = "------"
			p_type.text = "-"
			p_power.text = "-"
	if wz == 2 and !p_move:
		jt_1.hide()
		jt_2.show()
		jt_3.hide()
		jt_4.hide()
		if player_move.size() >= 2 and ys == 1:
			move_2.text = player_move[1].name
			type.text = player_move[1].type
			power.text = str(player_move[1].power)
		elif player_move.size() >= 6 and ys == 2:
			move_2.text = player_move[5].name
			type.text = player_move[5].type
			power.text = str(player_move[5].power)
		elif player_move.size() >= 7 and ys == 3:
			move_2.text = player_move[9].name
			type.text = player_move[9].type
			power.text = str(player_move[9].power)
		elif player_move.size() >= 14 and ys == 4:
			move_2.text = player_move[13].name
			type.text = player_move[13].type
			power.text = str(player_move[13].power)
		elif player_move.size() >= 18 and ys == 5:
			move_2.text = player_move[17].name
			type.text = player_move[17].type
			power.text = str(player_move[17].power)
		else:
			move_2.text = "------"
			type.text = "-"
			power.text = "-"
	if wz == 3 and !p_move:
		jt_1.hide()
		jt_2.hide()
		jt_3.show()
		jt_4.hide()
		if player_move.size() >= 3 and ys == 1:
			move_3.text = player_move[2].name
			type.text = player_move[2].type
			power.text = str(player_move[2].power)
		elif player_move.size() >= 7 and ys == 2:
			move_3.text = player_move[6].name
			type.text = player_move[6].type
			power.text = str(player_move[6].power)
		elif player_move.size() >= 11 and ys == 3:
			move_3.text = player_move[10].name
			type.text = player_move[10].type
			power.text = str(player_move[10].power)
		elif player_move.size() >= 15 and ys == 4:
			move_3.text = player_move[14].name
			type.text = player_move[14].type
			power.text = str(player_move[14].power)
		elif player_move.size() >= 19 and ys == 5:
			move_3.text = player_move[18].name
			type.text = player_move[18].type
			power.text = str(player_move[18].power)
		else:
			move_3.text = "------"
			type.text = "-"
			power.text = "-"
	if wz == 4 and !p_move:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.show()
		if player_move.size() >= 4 and ys == 1:
			move_4.text = player_move[3].name
			type.text = player_move[3].type
			power.text = str(player_move[3].power)
		elif player_move.size() >= 8 and ys == 2:
			move_4.text = player_move[7].name
			type.text = player_move[7].type
			power.text = str(player_move[7].power)
		elif player_move.size() >= 12 and ys == 3:
			move_4.text = player_move[11].name
			type.text = player_move[11].type
			power.text = str(player_move[11].power)
		elif player_move.size() >= 16 and ys == 4:
			move_4.text = player_move[15].name
			type.text = player_move[15].type
			power.text = str(player_move[15].power)
		elif player_move.size() >= 20 and ys == 5:
			move_4.text = player_move[19].name
			type.text = player_move[19].type
			power.text = str(player_move[19].power)
		else:
			move_4.text = "------"
			type.text = "-"
			power.text = "-"

func gh_move():
	if p_wz == 1:
		for i in 4:
			if player_pokemon.move_number[i] == wz + (ys - 1) * 4 - 1:
				return 1
		player_pokemon.move1 = wz + (ys - 1) * 4 - 1
		player_pokemon.move_number[0] = wz + (ys - 1) * 4 - 1
		player_pokemon.move_pp[0] = player_pokemon._move[wz + (ys - 1) * 4 -1].pp
	elif p_wz == 2:
		for i in 4:
			if player_pokemon.move_number[i] == wz + (ys - 1) * 4 - 1:
				return 1
		player_pokemon.move2 = wz + (ys - 1) * 4 - 1
		player_pokemon.move_number[1] = wz + (ys - 1) * 4 - 1
		player_pokemon.move_pp[1] = player_pokemon._move[wz + (ys - 1) * 4 -1].pp
	elif p_wz == 3:
		for i in 4:
			if player_pokemon.move_number[i] == wz + (ys - 1) * 4 - 1:
				return 1
		player_pokemon.move3 = wz + (ys - 1) * 4 - 1
		player_pokemon.move_number[2] = wz + (ys - 1) * 4 - 1
		player_pokemon.move_pp[2] = player_pokemon._move[wz + (ys - 1) * 4 -1].pp
	elif p_wz == 4:
		for i in 4:
			if player_pokemon.move_number[i] == wz + (ys - 1) * 4 - 1:
				return 1
		player_pokemon.move4 = wz + (ys - 1) * 4 - 1
		player_pokemon.move_number[3] = wz + (ys - 1) * 4 - 1
		player_pokemon.move_pp[3] = player_pokemon._move[wz + (ys - 1) * 4 -1].pp
	p_move_1.text = player_pokemon._move[player_pokemon.move1].name
	p_move_2.text = player_pokemon._move[player_pokemon.move2].name
	p_move_3.text = player_pokemon._move[player_pokemon.move3].name
	p_move_4.text = player_pokemon._move[player_pokemon.move4].name
	PlayerData.save(player_pokemon, player_pokemon.wz)
	return 0
