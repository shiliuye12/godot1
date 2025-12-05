extends PathFollow2D

@export var speed = 100


func _physics_process(delta: float) -> void:
	progress += speed * delta
