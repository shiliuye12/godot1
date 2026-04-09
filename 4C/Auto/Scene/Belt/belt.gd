extends Area2D

class_name Belt

var _item: item
var _rotation: Vector2 = Vector2(0, 0)
var _can_move = false
var next_belt = null
var speed = 75
var item_queue: Array

func _ready() -> void:
	Global.item_on.connect(_item_on)

func _on_body_entered(body: Node2D) -> void:
	if body is item:
		await get_tree().create_timer(0.5).timeout
		if body:
			_item = body

func _process(delta: float) -> void:
	update_rotation()
	if _item and _can_move and _item.can_move:
		if item_queue:
			item_queue.remove_at(0)
		if next_belt:
			if next_belt is Belt or next_belt is Splitter:
				if !(_item in next_belt.item_queue):
					next_belt.item_queue.append(_item)
				if next_belt.item_queue and next_belt._item == null:
					for i in range(next_belt.item_queue.size()-1, -1, -1):
						var x = next_belt.item_queue[i]
						if not is_instance_valid(x):
							next_belt.item_queue.remove_at(i)
							continue
					if next_belt.item_queue[0] == _item:
						_item.move = _rotation
						_item.position += speed * _rotation * delta
			elif next_belt.is_in_group("building"):
				if next_belt.items_data.number < 20 and next_belt.can_enter(_item):
					_item.move = _rotation
					_item.position += speed * _rotation * delta
			elif next_belt.is_in_group("box"):
				_item.move = _rotation
				_item.position += speed * _rotation * delta

func update_rotation():
	if int(rotation_degrees + 0.5) % 360 == 0:
		_rotation = Vector2.RIGHT
	elif int(rotation_degrees + 0.5) % 360 == 90:
		_rotation = Vector2.DOWN
	elif int(rotation_degrees + 0.5) % 360 == 180:
		_rotation = Vector2.LEFT
	elif int(rotation_degrees + 0.5) % 360 == 270:
		_rotation = Vector2.UP

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Belt:
		_can_move = true
		next_belt = area
	elif area.is_in_group("building"):
		_can_move = true
		next_belt = area
	elif area.is_in_group("box"):
		_can_move = true
		next_belt = area
	elif area is Splitter:
		_can_move = true
		next_belt = area

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Belt:
		_can_move = false
		next_belt = null
	elif area is Splitter:
		_can_move = false
		next_belt = null
	elif area.is_in_group("box"):
		_can_move = false
		next_belt = null
	elif area.is_in_group("building"):
		_can_move = false
		next_belt = null




@export var rect: Rect2
@onready var sprite_2d: Sprite2D = $Sprite2D

var slot_: Slot

func update():
	sprite_2d.texture = slot_.item.texture

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1

func _on_body_exited(body: Node2D) -> void:
	if _item:
		#if next_belt:
			#next_belt.item_queue.erase(_item)
		_item.can_move()
		_item = null

func _item_on(a: item):
	if next_belt:
		if next_belt is Belt or next_belt is Splitter:
			if next_belt.item_queue:
				if a in next_belt.item_queue:
					item_queue.erase(a)

	if next_belt == null:
		if item_queue:
			if a in item_queue:
				item_queue.erase(a)
