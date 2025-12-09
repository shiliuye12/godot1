extends CharacterBody2D

const speed: int = 100
var score = 0

func _physics_process(delta: float) -> void:
	velocity.y = speed
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	score += 1

func _process(delta: float) -> void:
	if score == 10:
		queue_free()
