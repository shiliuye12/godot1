extends Area2D
class_name Exit

var out_item_data = {
	"number": 0,
	"slot":null
}
var item
var ui = null
var next_building = null
var can_produce = false
var can_exit = false

@onready var timer: Timer = $Timer
@onready var player_data = preload("res://Resource/player_data.tres")

const ITEM = preload("uid://dg2dt3330rsms")
const EXIT_UI = preload("uid://bxtw3otbppgya")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left"):
		ui = EXIT_UI.instantiate()
		ui.building = self
		add_child(ui)

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
	can_exit = true
	for i in player_data.Slots.size():
		if out_item_data.slot.item == player_data.Slots[i].item:
			var new_item = ITEM.instantiate()
			var slot_: Slot = Slot.new()
			slot_.item = Item.new()
			var item_node = get_node("/root/Main/items")
			item_node.add_child(new_item)
			player_data.Slots[i].number -= 1
			out_item_data.number -= 1
			new_item.slot_ = slot_
			new_item.slot_.item = out_item_data.slot.item
			new_item.slot_.number = 1
			new_item.update()
			new_item.global_position = next_building.global_position
			
			if player_data.Slots[i].number <= 0:
				player_data.Slots[i].item = null
				player_data.Slots[i].number = 0
				out_item_data.slot = null
				out_item_data.number = 0
			save_data()
			break


func _process(delta: float) -> void:
	if next_building and can_produce and out_item_data.number >= 1 and can_exit:
		can_produce = false
		can_exit = false
		timer.start()

func _on_exit_area_entered(area: Area2D) -> void:
	if area is Belt:
		next_building = area
		can_produce = true
		can_exit = true

func _on_exit_body_exited(body: Node2D) -> void:
	if body is item:
		can_produce = true

func _on_exit_area_exited(area: Area2D) -> void:
	if area is Belt:
		next_building = null
		can_produce = false

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")
