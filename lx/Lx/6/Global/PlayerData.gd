extends Node

var pokemon_number = 0
var dq_pokemon = 0

var pokemon1: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": [],
	"wz": -1
}

var pokemon2: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
}

var pokemon3: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
}

var pokemon4: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
}

var pokemon5: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
}

var pokemon6: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
}
var pokemons: Array = [pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6]

func save(pokemon: Node2D, a: int):
	if a <= dq_pokemon + 1:
		pokemons[a - 1]["id"] = pokemon.id
		pokemons[a - 1]["level"] = pokemon.level
		pokemons[a - 1]["hp"] = pokemon.hp
		pokemons[a - 1]["gtz"] = pokemon.gtz
		pokemons[a - 1]["move"] = pokemon.move_number
		pokemons[a - 1]["move_pp"] = pokemon.move_pp
		pokemons[a - 1]["wz"] = pokemon.wz
	elif  a > dq_pokemon:
		dq_pokemon += 1

func pokemon_load(a: int):
	if a <= 6 and a > 0:
		return pokemons[a - 1]
	else:
		return 

func _process(delta: float) -> void:
	if pokemon1 != null:
		#print(pokemon1["move"])
		return
