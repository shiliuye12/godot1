extends Area2D
class_name Sawmill

var items_data = {
	"number": 0,
	"slot":null
}
var out_item_data = {
	"number": 0,
	"slot":null
}
var craft = true
var item
var ui = null
var next_building = null
var can_produce = false
var recipe_wz = 0
var recipes: Array

@onready var timer: Timer = $Timer

@onready var recipe = preload("uid://cy6v05nmqncyp")
const BUILDING_UI = preload("uid://dc1ske4gora4r")
const ITEM = preload("uid://dg2dt3330rsms")

func _ready() -> void:
	for i in recipe.recipes.size():
		if recipe.recipes[i]:
			if recipe.recipes[i].outitem.name == "木板":
				recipes.append(recipe.recipes[i])
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
	if items_data.slot:
		if body.id == items_data.slot.item.id:
			return true
		else:
			return false
	else:
		items_data.number = 0
		return true

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

func _on_timer_timeout() -> void:
	craft = true
	var slot_: Slot = Slot.new()
	slot_.item = Item.new()
	out_item_data.slot = slot_
	out_item_data.number += 1
	out_item_data.slot.item = recipes[recipe_wz].outitem

func _process(delta: float) -> void:
	if items_data.slot:
		if items_data.slot.item.name == recipes[recipe_wz].inputitem1 and craft:
			if items_data.number >= recipes[recipe_wz].inputCount1:
				if out_item_data.number < 20:
					craft = false
					items_data.number -= recipes[recipe_wz].inputCount1
					timer.start()
				elif out_item_data.number >= 20:
					craft = false
	if next_building and can_produce and out_item_data.number >= 1:
		can_produce = false
		var new_item = ITEM.instantiate()
		var item_node = get_node("/root/Main/items")
		item_node.add_child(new_item)
		out_item_data.number -= 1
		var slot_: Slot = Slot.new()
		slot_.item = recipes[recipe_wz].outitem
		slot_.number = 1
		new_item.slot_ = slot_
		new_item.update()
		new_item.global_position = next_building.global_position
	if items_data.number <= 0:
		items_data.number = 0
		items_data.slot = null

func _on_exit_area_entered(area: Area2D) -> void:
	if area is Belt:
		next_building = area
		can_produce = true

func _on_exit_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce = true

func _on_exit_area_exited(area: Area2D) -> void:
	if area is Belt:
		next_building = null
		can_produce = false
