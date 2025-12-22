extends Node

var pokemon_number = 0
var dq_pokemon = 0

var pokemon1: Dictionary = {
	"id": -1,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move": [],
	"move_pp": []
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

func save(pokemon: Node2D):
	dq_pokemon += 1
	if dq_pokemon <= 6 and dq_pokemon > 0:
		pokemons[dq_pokemon - 1]["id"] = pokemon.id
		pokemons[dq_pokemon - 1]["level"] = pokemon.level
		pokemons[dq_pokemon - 1]["hp"] = pokemon.hp
		pokemons[dq_pokemon - 1]["gtz"] = pokemon.gtz
		pokemons[dq_pokemon - 1]["move"] = pokemon.move_number
		pokemons[dq_pokemon - 1]["move_pp"] = pokemon.move_pp
	else:
		dq_pokemon -= 1
		return

func pokemon_load(a: int):
	if a <= 6 and a > 0:
		return pokemons[a - 1]
	else:
		return 
