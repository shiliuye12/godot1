extends Area2D

class_name Bullet

var _direction = Vector2(50, -50)

func _physics_process(delta: float) -> void:
	position += _direction * delta


func _on_area_entered(area: Area2D) -> void:
	queue_free()
