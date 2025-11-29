extends Node

var _a = 1

func _on_timer_timeout() -> void:
	var new_enemy = Enemise.add_enemy()
	var a: float = randf()
	new_enemy.is_left = true if a <= 0.5 else false
	if new_enemy.is_left == true:
		new_enemy.position.x = -100
		new_enemy.position.y = randf_range(50.0, 250.0)
	else:
		new_enemy.position.x = 676
		new_enemy.position.y = randf_range(50.0, 270.0)
		
	add_child(new_enemy)


func _on_game_timer_timeout() -> void:
	HubSignal.on_time.emit(_a)
	_a += 1
