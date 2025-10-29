extends Node

signal player_damaged
signal ex_collected(number: float)
signal ability_upgrade_added(upgrade: AbilityUpgrade,current_upgrades:Dictionary)

func emit_ex_collected(number: float):
	ex_collected.emit(number)
	
func emit_ability_upgrade_added(upgrade: AbilityUpgrade,current_upgrades:Dictionary):
	ability_upgrade_added.emit(upgrade,current_upgrades)

func emit_player_damaged():
	player_damaged.emit()
