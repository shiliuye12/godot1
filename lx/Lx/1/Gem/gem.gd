extends Area2D

class_name Gem
const SPEED = 100
signal gem_enter
signal game_over

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += SPEED * delta
	if position.y >= get_viewport_rect().end.y+50:
		game_over.emit()
		die()

func die():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Paddle:
		gem_enter.emit()
		die()
