extends Control

@onready var marker_2d: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D
@onready var marker_2d_2: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D2
@onready var marker_2d_3: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D3
@onready var marker_2d_4: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D4
@onready var marker_2d_5: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D5
@onready var marker_2d_6: Marker2D = $PlayerPokemons/MarginContainer3/Marker2D6
@onready var sprite_2d: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D
@onready var sprite_2d_2: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D2
@onready var sprite_2d_3: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D3
@onready var sprite_2d_4: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D4
@onready var sprite_2d_5: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D5
@onready var sprite_2d_6: Sprite2D = $PlayerPokemons/MarginContainer3/Sprite2D6
@onready var hp: Label = $PlayerPokemons/MarginContainer/hp
@onready var move_1: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer/move1
@onready var pp_1: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer/pp1
@onready var move_2: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer2/move2
@onready var pp_2: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer2/pp2
@onready var move_3: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer3/move3
@onready var pp_3: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer3/pp3
@onready var move_4: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer4/move4
@onready var pp_4: Label = $PlayerPokemons/MarginContainer2/GridContainer/VBoxContainer4/pp4

var player_pokemon_data1 = PlayerData.pokemon_load(1)
var player_pokemon_data2
var player_pokemon_data3
var player_pokemon_data4
var player_pokemon_data5
var player_pokemon_data6
var player_pokemon1 = PokemonManager.Pokemon_instantiate(player_pokemon_data1["id"])
var player_pokemon2
var player_pokemon3
var player_pokemon4
var player_pokemon5
var player_pokemon6

var wz: int = 0
var pokemon: Array = []

func _unhandled_input(event: InputEvent) -> void:
	if wz <= 3 and event.is_action_pressed("pokemon_down"):
		wz += 2
	if wz % 2 == 1 and event.is_action_pressed("pokemon_left"):
		wz -= 1
	if wz % 2 == 0 and event.is_action_pressed("pokemon_right"):
		wz += 1
	if wz >= 2 and event.is_action_pressed("pokemon_up"):
		wz -= 2
	if event.is_action_pressed("pokemon_qd") and wz + 1 != PlayerData.dq_pokemon_wz and pokemon.size() > wz and PlayerData.pokemons[wz]["hp"] > 0:
		PlayerData.dq_pokemon_wz = wz + 1
		PokemonSignalHub.on_new_pokemon_data.emit(pokemon[wz])

func _ready() -> void:
	wz = 0
	sprite_2d.show()
	sprite_2d_2.hide()
	sprite_2d_3.hide()
	sprite_2d_4.hide()
	sprite_2d_5.hide()
	sprite_2d_6.hide()
	player_pokemon1.position = marker_2d.global_position
	player_pokemon1.scale = Vector2(0.7, 0.7)
	add_child(player_pokemon1)
	player_pokemon1.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
	start_move(player_pokemon1, player_pokemon_data1)
	player_pokemon1.hp = player_pokemon_data1.hp
	player_pokemon1.mx()
	pokemon.append(player_pokemon_data1)
	if PlayerData.dq_pokemon > 1:
		player_pokemon_data2 = PlayerData.pokemon_load(2)
		player_pokemon2 = PokemonManager.Pokemon_instantiate(player_pokemon_data2["id"])
		player_pokemon2.position = marker_2d_2.global_position
		player_pokemon2.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon2)
		player_pokemon2.a_level(player_pokemon_data2["level"], player_pokemon_data2["gtz"])
		start_move(player_pokemon2, player_pokemon_data2)
		player_pokemon2.hp = player_pokemon_data2.hp
		player_pokemon2.mx()
		pokemon.append(player_pokemon_data2)
	if PlayerData.dq_pokemon > 2:
		player_pokemon_data3 = PlayerData.pokemon_load(3)
		player_pokemon3 = PokemonManager.Pokemon_instantiate(player_pokemon_data3["id"])
		player_pokemon3.position = marker_2d_3.global_position
		player_pokemon3.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon3)
		player_pokemon3.a_level(player_pokemon_data3["level"], player_pokemon_data3["gtz"])
		start_move(player_pokemon3, player_pokemon_data3)
		player_pokemon3.hp = player_pokemon_data3.hp
		player_pokemon3.mx()
		pokemon.append(player_pokemon_data3)
	if PlayerData.dq_pokemon > 3:
		player_pokemon_data4 = PlayerData.pokemon_load(4)
		player_pokemon4 = PokemonManager.Pokemon_instantiate(player_pokemon_data4["id"])
		player_pokemon4.position = marker_2d_4.global_position
		player_pokemon4.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon4)
		player_pokemon4.a_level(player_pokemon_data4["level"], player_pokemon_data4["gtz"])
		start_move(player_pokemon4, player_pokemon_data4)
		player_pokemon4.hp = player_pokemon_data4.hp
		player_pokemon4.mx()
		pokemon.append(player_pokemon_data4)
	if PlayerData.dq_pokemon > 4:
		player_pokemon_data5 = PlayerData.pokemon_load(5)
		player_pokemon5 = PokemonManager.Pokemon_instantiate(player_pokemon_data5["id"])
		player_pokemon5.position = marker_2d_5.global_position
		player_pokemon5.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon5)
		player_pokemon5.a_level(player_pokemon_data5["level"], player_pokemon_data5["gtz"])
		start_move(player_pokemon5, player_pokemon_data5)
		player_pokemon5.hp = player_pokemon_data5.hp
		player_pokemon5.mx()
		pokemon.append(player_pokemon_data5)
	if PlayerData.dq_pokemon > 5:
		player_pokemon_data6 = PlayerData.pokemon_load(6)
		player_pokemon6 = PokemonManager.Pokemon_instantiate(player_pokemon_data6["id"])
		player_pokemon6.position = marker_2d_6.global_position
		player_pokemon6.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon6)
		player_pokemon6.a_level(player_pokemon_data6["level"], player_pokemon_data6["gtz"])
		start_move(player_pokemon6, player_pokemon_data6)
		player_pokemon6.hp = player_pokemon_data6.hp
		player_pokemon6.mx()
		pokemon.append(player_pokemon_data6)
	var hp_0 = 0
	for i in pokemon.size():
		if pokemon[i].hp == 0:
			hp_0 += 1
	if hp_0 == pokemon.size():
		PokemonScenesChoose.to_game_over() 

func _process(_delta: float) -> void:
	if wz == 0:
		sprite_2d.show()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		move_csh()
		hp.text = str(player_pokemon1.hp) + "/" + str(player_pokemon1.max_hp)
		move(player_pokemon1)
	if wz == 1:
		sprite_2d.hide()
		sprite_2d_2.show()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		move_csh()
		if PlayerData.dq_pokemon >= 2:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
			move(player_pokemon2)
		else:
			hp.text = "-"
	if wz == 2:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.show()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		move_csh()
		if PlayerData.dq_pokemon >= 3:
			hp.text = str(player_pokemon3.hp) + "/" + str(player_pokemon3.max_hp)
			move(player_pokemon3)
		else:
			hp.text = "-"
	if wz == 3:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.show()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		move_csh()
		if PlayerData.dq_pokemon >= 4:
			hp.text = str(player_pokemon4.hp) + "/" + str(player_pokemon4.max_hp)
			move(player_pokemon4)
		else:
			hp.text = "-"
	if wz == 4:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.show()
		sprite_2d_6.hide()
		move_csh()
		if PlayerData.dq_pokemon >= 5:
			hp.text = str(player_pokemon5.hp) + "/" + str(player_pokemon6.max_hp)
			move(player_pokemon5)
		else:
			hp.text = "-"
	if wz == 5:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.show()
		move_csh()
		if PlayerData.dq_pokemon >= 6:
			hp.text = str(player_pokemon6.hp) + "/" + str(player_pokemon6.max_hp)
			move(player_pokemon6)
		else:
			hp.text = "-"

func start_move(player_pokemon: Node2D, player_pokemon_data: Dictionary):
	player_pokemon.move1 = player_pokemon_data["move"][0]
	player_pokemon.move_pp = player_pokemon_data["move_pp"]
	if player_pokemon.move_num > 1:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
	if player_pokemon.move_num > 2:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2] 
	if player_pokemon.move_num > 3:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2]
		player_pokemon.move4 = player_pokemon_data["move"][3]
	player_pokemon.move_number = player_pokemon_data["move"]

func move(player_pokemon: Node2D):
	move_1.text = player_pokemon._move[player_pokemon.move1].name
	pp_1.text = str(player_pokemon.move_pp[0]) + "/" + str(player_pokemon._move[player_pokemon.move1].pp)
	if player_pokemon.move_num >= 2:
		move_2.text = player_pokemon._move[player_pokemon.move2].name
		pp_2.text = str(player_pokemon.move_pp[1]) + "/" + str(player_pokemon._move[player_pokemon.move2].pp)
	if player_pokemon.move_num >= 3:
		move_3.text = player_pokemon._move[player_pokemon.move3].name
		pp_3.text = str(player_pokemon.move_pp[2]) + "/" + str(player_pokemon._move[player_pokemon.move3].pp)
	if player_pokemon.move_num >= 4:
		move_4.text = player_pokemon._move[player_pokemon.move4].name
		pp_4.text = str(player_pokemon.move_pp[3]) + "/" + str(player_pokemon._move[player_pokemon.move4].pp)

func move_csh():
	move_1.text = "无"
	move_2.text = "无"
	move_3.text = "无"
	move_4.text = "无"
	pp_1.text = "-"
	pp_2.text = "-"
	pp_3.text = "-"
	pp_4.text = "-"
