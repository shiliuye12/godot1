extends Control

func _ready() -> void:
	PlayerData.level = 0
	PlayerData.pokemon_number = 0
	PlayerData.dq_pokemon = 0
	PlayerData.dq_pokemon_wz = 1
	PlayerData.level = 0
	PlayerData.poke_ball = 1
	PlayerData.great_ball = 1
	PlayerData.ultra_ball = 1
	PlayerData.master_ball = 1
	PlayerData.potion = 1
	PlayerData.super_potion = 1
	PlayerData.hyper_potion = 1
	PlayerData.max_potion = 1
	PlayerData.coin = 1000
	PlayerData.pokemon1 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}

	PlayerData.pokemon2 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}

	PlayerData.pokemon3 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}

	PlayerData.pokemon4 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}

	PlayerData.pokemon5 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}

	PlayerData.pokemon6 = {
		"id": -1,
		"level": 0,
		"hp": 0,
		"gtz": 0,
		"move": [],
		"move_pp": [],
		"wz": -1,
		"ex": 0
	}
	PlayerData.game_over()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_qd"):
		PokemonScenesChoose.to_main()
