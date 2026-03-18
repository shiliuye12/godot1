extends Control

const W = preload("uid://dkw1wycg6ydqq")
@onready var grid_container: GridContainer = $MarginContainer/MarginContainer/GridContainer

func _ready() -> void:
	for i in InventorySystem.items:
		var new_item = W.instantiate()
		grid_container.add_child(new_item)
		new_item.set_tex(i)
