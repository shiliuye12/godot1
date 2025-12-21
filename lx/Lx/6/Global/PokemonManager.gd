extends Node

const CHARMANDER = preload("uid://wa4hdghgrvc3")
const BULBASAUR = preload("uid://bbahbordh5r7v")
const SQUIRTLE = preload("uid://b22gyotf484jo")

var pokemon_id: Array = [CHARMANDER, BULBASAUR, SQUIRTLE]

func Pokemon_instantiate(_pokemon_id: int):
	if !_pokemon_id >= pokemon_id.size():
		var new_pokemon = pokemon_id[_pokemon_id].instantiate()
		return new_pokemon
	return
