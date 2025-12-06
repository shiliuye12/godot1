extends Area2D

var a: int = 1

func _on_timer_timeout() -> void:
	move()

func move():
	var _player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	var new_position = _player.wz[a]
	position = new_position


func _on_body_entered(body: Node2D) -> void:
	if body is Player and a!= 1:
		SnakeSignalHub.on_game_over.emit()
