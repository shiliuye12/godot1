extends Node2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_box: Area2D = $Visuals/HitBox


func antivate_collisions():
	hit_box.set_deferred("monitoring", true)
	hit_box.set_deferred("monitorable", true)

func _on_trigger_area_entered(area: Area2D) -> void:
	animation_tree["parameters/conditions/on_trigger"] = true
