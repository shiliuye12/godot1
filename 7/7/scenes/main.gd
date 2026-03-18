extends Node2D

const BB = preload("uid://c6w75lub55sjv")
@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("open_bb"):
		var new = BB.instantiate()
		canvas_layer.add_child(new)
