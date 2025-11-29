extends Node2D

const PLAYER = preload("uid://dbtj0daf8218f")

@onready var marker_2d: Marker2D = $Marker2D

func _enter_tree() -> void:
	var _player = PLAYER.instantiate()
	add_child(_player)
