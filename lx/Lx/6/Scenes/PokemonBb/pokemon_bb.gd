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

func _unhandled_input(event: InputEvent) -> void:
	if wz <= 3 and event.is_action_pressed("pokemon_down"):
		wz += 2
	if wz % 2 == 1 and event.is_action_pressed("pokemon_left"):
		wz -= 1
	if wz % 2 == 0 and event.is_action_pressed("pokemon_right"):
		wz += 1
	if wz >= 2 and event.is_action_pressed("pokemon_up"):
		wz -= 2

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
	player_pokemon1.mx()
	if PlayerData.dq_pokemon > 1:
		player_pokemon_data2 = PlayerData.pokemon_load(2)
		player_pokemon2 = PokemonManager.Pokemon_instantiate(player_pokemon_data2["id"])
		player_pokemon2.position = marker_2d_2.global_position
		player_pokemon2.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon2)
		player_pokemon2.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
		player_pokemon2.mx()
	if PlayerData.dq_pokemon > 2:
		player_pokemon_data3 = PlayerData.pokemon_load(3)
		player_pokemon3 = PokemonManager.Pokemon_instantiate(player_pokemon_data3["id"])
		player_pokemon3.position = marker_2d_3.global_position
		player_pokemon3.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon3)
		player_pokemon3.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
		player_pokemon3.mx()
	if PlayerData.dq_pokemon > 3:
		player_pokemon_data4 = PlayerData.pokemon_load(4)
		player_pokemon4 = PokemonManager.Pokemon_instantiate(player_pokemon_data4["id"])
		player_pokemon4.position = marker_2d_4.global_position
		player_pokemon4.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon4)
		player_pokemon4.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
		player_pokemon4.mx()
	if PlayerData.dq_pokemon > 4:
		player_pokemon_data5 = PlayerData.pokemon_load(5)
		player_pokemon5 = PokemonManager.Pokemon_instantiate(player_pokemon_data5["id"])
		player_pokemon5.position = marker_2d_5.global_position
		player_pokemon5.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon5)
		player_pokemon5.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
		player_pokemon5.mx()
	if PlayerData.dq_pokemon > 5:
		player_pokemon_data6 = PlayerData.pokemon_load(6)
		player_pokemon6 = PokemonManager.Pokemon_instantiate(player_pokemon_data6["id"])
		player_pokemon6.position = marker_2d_6.global_position
		player_pokemon6.scale = Vector2(0.7, 0.7)
		add_child(player_pokemon6)
		player_pokemon6.a_level(player_pokemon_data1["level"], player_pokemon_data1["gtz"])
		player_pokemon6.mx()

func _process(_delta: float) -> void:
	if wz == 0:
		sprite_2d.show()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		hp.text = str(player_pokemon1.hp) + "/" + str(player_pokemon1.max_hp)
	if wz == 1:
		sprite_2d.hide()
		sprite_2d_2.show()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		if PlayerData.dq_pokemon >= 2:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
		else:
			hp.text = "-"
	if wz == 2:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.show()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		if PlayerData.dq_pokemon >= 3:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
		else:
			hp.text = "-"
	if wz == 3:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.show()
		sprite_2d_5.hide()
		sprite_2d_6.hide()
		if PlayerData.dq_pokemon >= 4:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
		else:
			hp.text = "-"
	if wz == 4:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.show()
		sprite_2d_6.hide()
		if PlayerData.dq_pokemon >= 5:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
		else:
			hp.text = "-"
	if wz == 5:
		sprite_2d.hide()
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		sprite_2d_5.hide()
		sprite_2d_6.show()
		if PlayerData.dq_pokemon >= 6:
			hp.text = str(player_pokemon2.hp) + "/" + str(player_pokemon2.max_hp)
		else:
			hp.text = "-"
