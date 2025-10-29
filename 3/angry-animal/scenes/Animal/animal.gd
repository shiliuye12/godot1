extends RigidBody2D

@onready var debug_label: Label = $DebugLabel
@onready var kick_sound: AudioStreamPlayer2D = $KickSound
@onready var steretch_sound: AudioStreamPlayer2D = $SteretchSound
@onready var launch_sound: AudioStreamPlayer2D = $LaunchSound
@onready var arrow: Sprite2D = $Arrow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	pass # Replace with function body.
