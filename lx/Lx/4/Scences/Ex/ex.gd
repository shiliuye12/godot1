extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SnakeSignalHub.on_score.emit()
		queue_free()
