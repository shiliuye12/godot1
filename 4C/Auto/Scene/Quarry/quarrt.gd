extends Node2D

const ITEM = preload("uid://dg2dt3330rsms")
const Item = preload("uid://5po6te85tamv")
const STONE = preload("uid://csjn7qaau0ubx")

@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var timer_4: Timer = $Timer4
@onready var timer: Timer = $Timer
var belt
var belt_2
var belt_3
var belt_4
var can_produce = true
var can_produce_2 = true
var can_produce_3 = true
var can_produce_4 = true

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
		slot_.item.name = STONE.name
		slot_.item.texture = STONE.texture
		slot_.item.ms = STONE.ms
		slot_.item.id = STONE.id
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
		new_item.global_position = belt.global_position

func _process(delta: float) -> void:
	pass
	#if belt and can_produce == true and timer.is_stopped():
		#timer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce = true
		if belt and can_produce == true and timer.is_stopped():
			timer.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is item:
		can_produce = false

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Belt:
		belt = null
		timer.stop()



func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area is Belt:
		belt_2 = area
		timer_2.start()

func _on_area_2d_2_area_exited(area: Area2D) -> void:
	if area is Belt:
		belt_2 = null
		timer_2.stop()

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is item:
		can_produce_2 = false

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce_2 = true
		if belt_2 and can_produce_2 == true and timer_2.is_stopped():
			timer_2.start()



func _on_area_2d_3_area_entered(area: Area2D) -> void:
	if area is Belt:
		belt_3 = area
		timer_3.start()

func _on_area_2d_3_area_exited(area: Area2D) -> void:
	if area is Belt:
		belt_3 = null
		timer_3.stop()

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body is item:
		can_produce_3 = false

func _on_area_2d_3_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce_3 = true
		if belt_3 and can_produce_3 == true and timer_3.is_stopped():
			timer_3.start()



func _on_area_2d_4_area_entered(area: Area2D) -> void:
	if area is Belt:
		belt_4 = area
		timer_4.start()

func _on_area_2d_4_area_exited(area: Area2D) -> void:
	if area is Belt:
		belt_4 = null
		timer_4.stop()

func _on_area_2d_4_body_entered(body: Node2D) -> void:
	if body is item:
		can_produce_4 = false

func _on_area_2d_4_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce_4 = true
		if belt_4 and can_produce_4 == true and timer_4.is_stopped():
			timer_4.start()


func _on_timer_2_timeout() -> void:
	if belt_2:
		var new_item = ITEM.instantiate()
		var item_node = get_node("/root/Main/items")
		item_node.add_child(new_item)
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item.name = STONE.name
		slot_.item.texture = STONE.texture
		slot_.item.ms = STONE.ms
		slot_.item.id = STONE.id
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
		new_item.global_position = belt_2.global_position


func _on_timer_3_timeout() -> void:
	if belt_3:
		var new_item = ITEM.instantiate()
		var item_node = get_node("/root/Main/items")
		item_node.add_child(new_item)
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item.name = STONE.name
		slot_.item.texture = STONE.texture
		slot_.item.ms = STONE.ms
		slot_.item.id = STONE.id
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
		new_item.global_position = belt_3.global_position


func _on_timer_4_timeout() -> void:
	if belt_4:
		var new_item = ITEM.instantiate()
		var item_node = get_node("/root/Main/items")
		item_node.add_child(new_item)
		var slot_: Slot = Slot.new()
		slot_.item = Item.new()
		slot_.item.name = STONE.name
		slot_.item.texture = STONE.texture
		slot_.item.ms = STONE.ms
		slot_.item.id = STONE.id
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
		new_item.global_position = belt_4.global_position
