extends Node

var pokemon_number = 0
var dq_pokemon = 0

var pokemon1: Dictionary = {
	"id": 0,
	"level": 0,
	"hp": 0,
	"gtz": 0,
	"move_num": 0,
	"type": "无",
	"type_2": "无",
	"move": []
}

var pokemons: Array = [pokemon1]

func save(pokemon: Node2D, num: int):
	pokemons[num]["id"] = pokemon.id
	pokemons[num]["level"] = pokemon.level
	pokemons[num]["hp"] = pokemon.hp
	pokemons[num]["gtz"] = pokemon.gtz
	pokemons[num]["move_num"] = pokemon.move_num
	pokemons[num]["type"] = pokemon.type
	pokemons[num]["type_2"] = pokemon.type_2
	pokemons[num]["move"] = pokemon.move_number
	print(pokemons[num]["id"],pokemons[num]["level"],pokemons[num]["hp"],pokemons[num]["gtz"]\
	,pokemons[num]["move_num"],pokemons[num]["type"],pokemons[num]["type_2"],pokemons[num]["move"])
