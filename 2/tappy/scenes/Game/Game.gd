extends Node2D

const PIPES = preload("uid://bv2uwe7ikgiij")
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point_2: Marker2D = $LowerPoint2
@onready var pipes_holder: Node = $PipesHolder

func _ready() -> void:
	pass

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_on_plane_died)


func spawn_pipes():
	var new_pipes = PIPES.instantiate()
	var pos_y = randf_range(
		upper_point.position.y,
		lower_point_2.position.y
	)
	new_pipes.position = Vector2(upper_point.position.x,pos_y)
	pipes_holder.add_child(new_pipes)

func _on_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_on_plane_died() -> void:
	get_tree().paused = true
