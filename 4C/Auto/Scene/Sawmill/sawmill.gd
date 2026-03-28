extends Node2D

var items_data = {
	"number": 0,
	"slot":null
}
var item
var ui = null

const BUILDING_UI = preload("uid://dc1ske4gora4r")

func _ready() -> void:
	pass
	#Global.ui_items_change.connect(_ui_items_change)

func _on_entry_body_entered(body: Node2D) -> void:
	if body is item:
		if items_data.slot != null:
			if items_data.slot.item != null:
				if items_data.slot.item.id == body.slot_.item.id:
					items_data.number += 1
					items_data.slot = body.slot_
					Global.items_change.emit(items_data)
					body.queue_free()
		elif items_data.slot == null:
			items_data.number = 1
			items_data.slot = body.slot_
			#Global.items_change.emit(items_data)
			body.queue_free()

func can_enter(body: item):
	if body.id == 1:
		return true
	else:
		return false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left"):
		ui = BUILDING_UI.instantiate()
		ui.building = self
		add_child(ui)
		ui.open(items_data)

#func _ui_items_change(slot: Slot):
	#items_data.slot = slot
	#items_data.number = slot.number
	#if items_data.number == 0:
		#items_data.slot = null


@export var rect: Rect2
@onready var sprite_2d: Sprite2D = $Sprite2D

var slot_: Slot

func update():
	sprite_2d.texture = slot_.item.texture

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
