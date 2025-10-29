extends Area2D

class_name Gem

signal gem_off_screen

const SPEED:int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += SPEED * delta
	if position.y > Game.get_vpr().end.y:
		gem_off_screen.emit()
		die()

func die():
	queue_free()

func _on_area_entered(_area: Area2D) -> void:
	die()
