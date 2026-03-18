@tool
extends GridContainer

@export var width = 5:
	set(value):
		width = value
		_remove_grid()
		_create_grid()
@export var height = 5:
	set(value):
		height = value
		_remove_grid()
		_create_grid()
@export var cellWidth = 100:
	set(value):
		cellWidth = value
		_remove_grid()
		_create_grid()
@export var cellHeight = 100:
	set(value):
		cellHeight = value
		_remove_grid()
		_create_grid()

const PANEL_CONTAINER = preload("uid://dxgb8du7iwou1")

func _create_grid():
	columns = width
	
	for i in width * height:
		var gz = PANEL_CONTAINER.instantiate()
		gz.custom_minimum_size = Vector2(cellWidth, cellHeight)
		add_child(gz.duplicate())

func _remove_grid():
	for node in get_children():
		node.queue_free()
