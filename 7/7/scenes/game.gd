extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

func _ready() -> void:
	_create_world()

func _create_world():
	for x in range(0, 100):
		for y in range(0, 100):
			var cell := Vector2i(x, y)
			if (x + y) % 2 == 1:
				tile_map_layer.set_cell(cell, 0, Vector2i.ZERO)
			else:
				tile_map_layer.set_cell(cell, 0, Vector2i(0, 4))
