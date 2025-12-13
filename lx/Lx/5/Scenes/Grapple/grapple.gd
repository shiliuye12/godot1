extends Area2D

class_name Grapple

@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var a = Vector2.ZERO

var _can_fs = true:
	get:
		return _can_fs
var shouhui = false
var xh = false
var shz = false
var weight = 1
var grapple_speed = 1

func _ready() -> void:
	if GoldChooseLevel.water_num > 0:
		grapple_speed = 2
		weight = grapple_speed

func _process(delta: float) -> void:
	var l = 6 * sprite_2d_2.scale.x
	var d = Vector2.RIGHT.rotated(sprite_2d_2.rotation)
	a = d * l
	a.y += 3
	if shz and sprite_2d_2.scale.x <= 3:
		GoldSignalHub.on_daoda.emit()
		shz = false
		weight = grapple_speed
		self.monitoring = true
	if _can_fs == false and shouhui == false:
		sprite_2d_2.scale.x += 0.4 * weight
		sprite_2d.position = a
		collision_shape_2d.position = a
	if shouhui == true:
		sprite_2d_2.scale.x -= 0.4 * weight
		sprite_2d.position = a
		collision_shape_2d.position = a
		self.monitoring = false
	if sprite_2d_2.scale.x <= 3:
		shouhui = false
		_can_fs = true
		xh = false
	if xh:
		GoldSignalHub.on_grapple_position.emit(sprite_2d.global_position)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("up") and _can_fs:
		_can_fs = false
	if event.is_action_pressed("down") and shouhui and GoldChooseLevel.bomb_num > 0:
		GoldSignalHub.on_bomb.emit()
		weight = grapple_speed

func _on_body_entered(body: Node2D) -> void:
	if body is StaticBody2D:
		shouhui = true

func _on_area_entered(area: Area2D) -> void:
	shouhui = true
	xh = true
	shz = true
	if GoldChooseLevel.water_num > 0:
		weight = area.weight * 2
	else:
		weight = area.weight
