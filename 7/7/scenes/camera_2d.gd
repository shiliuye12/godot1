extends Camera2D

@export var _target_zoom : float = 1
@export var MAX_ZOOM = 1
@export var MIN_ZOOM = 0.5
var _is_zoom_process = false
var camera_speed = 300

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("camera_down"):
		_zoom_out()
	elif event.is_action("camera_up"):
		_zoom_in()

func _physics_process(delta: float) -> void:
	if _is_zoom_process:
		zoom = _target_zoom * Vector2.ONE
		_is_zoom_process = false
	if Input.is_action_pressed("camera_move_down"):
		position.y += camera_speed * delta
	if Input.is_action_pressed("camera_move_up"):
		position.y -= camera_speed * delta
	if Input.is_action_pressed("camera_move_left"):
		position.x -= camera_speed * delta
	if Input.is_action_pressed("camera_move_right"):
		position.x += camera_speed * delta

func _zoom_in():
	_target_zoom += 0.04
	if _target_zoom >= MAX_ZOOM:
		_target_zoom = MAX_ZOOM
	_is_zoom_process = true

func _zoom_out():
	_target_zoom -= 0.04
	if _target_zoom <= MIN_ZOOM:
		_target_zoom = MIN_ZOOM
	_is_zoom_process = true
