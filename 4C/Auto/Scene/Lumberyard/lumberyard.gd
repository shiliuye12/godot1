extends Node2D

const ITEM = preload("uid://dg2dt3330rsms")
const WOOD = preload("uid://bjlnyb4651vrl")
const Item = preload("uid://5po6te85tamv")

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
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item.name = WOOD.name
		slot_.item.texture = WOOD.texture
		slot_.item.ms = WOOD.ms
		slot_.item.id = WOOD.id
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
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
