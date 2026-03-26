extends Node2D

const ITEM = preload("uid://dg2dt3330rsms")

@onready var timer: Timer = $Timer
var belt
var can_produce = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Belt:
		belt = area
		timer.start()

func _on_timer_timeout() -> void:
	if belt:
		var new_item = ITEM.instantiate()
		var item_node = get_node("/root/Main/items")
		item_node.add_child(new_item)
		new_item.global_position = belt.global_position

func _process(delta: float) -> void:
	if belt and can_produce == true and timer.is_stopped():
		timer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is item:
		can_produce = false
