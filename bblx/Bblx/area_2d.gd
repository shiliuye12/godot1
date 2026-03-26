extends Area2D
class_name CSD

var _rotation: Vector2 = Vector2.RIGHT
var on_belt: Array
var on_csd: Array
var speed = 20
var _if_csd = false
var _can_cs = false

func update_rotation():
	if int(rotation_degrees) % 360 == 0:
		_rotation = Vector2.RIGHT
	elif int(rotation_degrees) % 360 == 90:
		_rotation = Vector2.DOWN
	elif int(rotation_degrees) % 360 == 180:
		_rotation = Vector2.LEFT
	elif int(rotation_degrees) % 360 == 270:
		_rotation = Vector2.UP

func _on_body_entered(body: Node2D) -> void:
	if body is WP:
		on_belt.append(body)

func _on_body_exited(body: Node2D) -> void:
	if body is WP:
		body.move_fx = _rotation
		body.speed = speed
		body.move()
		on_belt.erase(body)

func _physics_process(delta: float) -> void:
	update_rotation()
	for body in on_belt:
		if _can_cs and _if_csd and body._can_move:
			body.position += speed * _rotation * delta
	if on_csd:
		if !on_csd[0].on_belt:
			_can_cs = true
		else:
			_can_cs = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is CSD:
		_if_csd = true
		on_csd.append(area)

#func _on_area_2d_area_exited(area: Area2D) -> void:
#	if area is CSD:
#		_if_csd = false
#		on_csd.erase(area)

@export var rect: Rect2

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
