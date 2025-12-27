extends Node

var pokemon_number = 0
var dq_pokemon = 0
var dq_pokemon_wz: int = 1
var level: int = 0

var poke_ball = 1
var great_ball = 1
var ultra_ball = 1
var master_ball = 1
var potion = 1
var super_potion = 1
var hyper_potion = 1
var max_potion = 1

var pokemon1: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}

var pokemon2: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}

var pokemon3: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}

var pokemon4: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}

var pokemon5: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}

var pokemon6: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1,
	"ex": 0
}
var pokemons: Array = [pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6]
var poke_ball_arr: Array = [poke_ball, great_ball, ultra_ball, master_ball]
var dj_arr: Array = [potion, super_potion, hyper_potion, max_potion]

func save(pokemon: Node2D, a: int):
	if a < dq_pokemon + 1:
		pokemons[a - 1]["id"] = pokemon.id
		pokemons[a - 1]["level"] = pokemon.level
		pokemons[a - 1]["hp"] = pokemon.hp
		pokemons[a - 1]["gtz"] = pokemon.gtz
		pokemons[a - 1]["move"] = pokemon.move_number
		pokemons[a - 1]["move_pp"] = pokemon.move_pp
		pokemons[a - 1]["wz"] = pokemon.wz
		pokemons[a - 1]["ex"] = pokemon.dq_ex
	elif  a >= dq_pokemon:
		pokemons[a - 1]["id"] = pokemon.id
		pokemons[a - 1]["level"] = pokemon.level
		pokemons[a - 1]["hp"] = pokemon.hp
		pokemons[a - 1]["gtz"] = pokemon.gtz
		pokemons[a - 1]["move"] = pokemon.move_number
		pokemons[a - 1]["move_pp"] = pokemon.move_pp
		pokemons[a - 1]["wz"] = pokemon.wz
		pokemons[a - 1]["ex"] = pokemon.dq_ex
		dq_pokemon += 1

func pokemon_load(a: int):
	if a <= 6 and a > 0:
		return pokemons[a - 1]
	else:
		return 

func dj_sy(_name: String):
	if _name == "精灵球":
		poke_ball -= 1
	if _name == "高级球":
		ultra_ball -= 1
	if _name == "超级球":
		great_ball -= 1
	if _name == "大师球":
		master_ball -= 1
	if _name == "伤药":
		potion -= 1
	if _name == "厉害伤药":
		hyper_potion -= 1
	if _name == "好伤药":
		super_potion -= 1
	if _name == "全满药":
		max_potion -= 1
	poke_ball_arr = [poke_ball, great_ball, ultra_ball, master_ball]
