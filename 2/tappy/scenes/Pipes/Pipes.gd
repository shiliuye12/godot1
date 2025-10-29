extends Node2D

@onready var laser: Area2D = $Laser

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 120 * delta
	if position.x < get_viewport_rect().position.x - 100:
		die()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()

func die():
	set_process(false)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.on_point_score.emit()
