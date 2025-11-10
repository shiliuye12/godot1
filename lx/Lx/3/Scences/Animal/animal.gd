extends RigidBody2D

@onready var arrow: Sprite2D = $arrow
@onready var kick: AudioStreamPlayer2D = $Kick
@onready var stretch: AudioStreamPlayer2D = $Stretch
@onready var launch: AudioStreamPlayer2D = $Launch

enum AnimalState {Ready, Drag, Release}

var _state: AnimalState
var _start = Vector2.ZERO
var _drag_start = Vector2.ZERO
var _dragged_vector = Vector2.ZERO
var _arrow_scale_x: float = 0.0

const SPEED: float = 20.0
const MAX: float = 1200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_state = AnimalState.Ready
	_start = position
	_arrow_scale_x = arrow.scale.x
	AnimalSignalHub._on_level_pass.connect(on_level_pass)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	update_state()



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("zuojian") and _state == AnimalState.Ready:
		change_state(AnimalState.Drag)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("zuojian") and _state == AnimalState.Drag:
		call_deferred("change_state",AnimalState.Release)

func change_state(new_state: AnimalState):
	if _state == new_state:
		return
	_state = new_state
	
	match _state:
		AnimalState.Drag:
			set_drag()
	match _state:
		AnimalState.Release:
			set_release()

func set_drag():
	arrow.show()
	_drag_start = get_global_mouse_position()
	
func update_state():
	if _state== AnimalState.Drag:
		var new_drag_vector = get_global_mouse_position() - _drag_start
		
		new_drag_vector = new_drag_vector.clamp(
			Vector2(-60,0),Vector2(0,60)
		)
		var diff = new_drag_vector - _dragged_vector
		
		if diff.length() > 0 and stretch.playing == false:
			stretch.play()
			
		_dragged_vector = new_drag_vector
		position = _dragged_vector + _start
		update_arrow_scale()
		
func set_release():
	if _state == AnimalState.Release:
		arrow.hide()
		launch.play()
		freeze = false
		apply_central_impulse(calculate_impulse())
		

func calculate_impulse():
	return _dragged_vector * -SPEED

func update_arrow_scale():
	var _len = calculate_impulse().length()
	var perc: float = clamp(_len / MAX,0.0,1.0) 
	arrow.scale.x = lerp(_arrow_scale_x, _arrow_scale_x * 2, perc)
	arrow.rotation = (_start - position).angle()


func _on_sleeping_state_changed() -> void:
	for body in get_colliding_bodies():
		if body is Cup:
			body.on_cup_die()
	AnimalSignalHub._on_animal_die.emit()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	AnimalSignalHub._on_animal_die.emit()
	queue_free()

func on_level_pass():
	get_tree().paused = true
