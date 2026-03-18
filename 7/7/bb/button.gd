extends Button

@onready var color_rect: ColorRect = $ColorRect
@onready var center_container: CenterContainer = $ColorRect/CenterContainer

var slot_button_slot_item: SlotItem

func _ready() -> void:
	reset_color()

func reset_color():
	color_rect.color = Color(0.5, 0.5, 0.5, 0.5)

func insert(SI: SlotItem):
	slot_button_slot_item = SI
	color_rect.color = Color(0.7, 0.7, 0.7, 0.8)
	center_container.add_child(slot_button_slot_item)
