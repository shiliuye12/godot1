extends Control

const XX_POKEMON_BB = preload("uid://byc1b2qkel8os")

var xx_bb = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pokemon_p"):
		if not xx_bb:
			xx_bb = XX_POKEMON_BB.instantiate()
			add_child(xx_bb)
