extends Node2D

@export var lives = 2
@export var points = 5

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_box: Area2D = $Visuals/HitBox
@onready var state_machine: AnimationNodeStateMachinePlayback = $AnimationTree["parameters/playback"]
@onready var visuals: Node2D = $Visuals

var _invincible = false

func antivate_collisions():
	hit_box.set_deferred("monitoring", true)
	hit_box.set_deferred("monitorable", true)

func take_damage():
	if _invincible == true:
		return
	
	set_invincible(true)
	state_machine.travel("hit")
	tween_hit()
	reduce_lives()

func tween_hit():
	var tween: Tween = create_tween()
	tween.tween_property(visuals, "position", Vector2.ZERO, 1.8)

func set_invincible(on: bool):
	_invincible = on

func reduce_lives():
	lives -= 1
	if lives <= 0:
		SignalHub.on_scored.emit(points)
		SignalHub.on_boss_killed.emit()
		queue_free()

func _on_trigger_area_entered(area: Area2D) -> void:
	animation_tree["parameters/conditions/on_trigger"] = true

func _on_hit_box_area_entered(area: Area2D) -> void:
	take_damage()
