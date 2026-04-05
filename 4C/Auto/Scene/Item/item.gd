extends CharacterBody2D
class_name item

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var player_data = preload("res://Resource/player_data.tres")

var slot_: Slot
var move: Vector2 = Vector2(0, 0)
var speed = 68
var _can_move = true
var id = -1

func update():
	sprite_2d.texture = slot_.item.texture
	id = slot_.item.id

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left"):
		for i in player_data.Slots.size():
			if player_data.Slots[i].item:
				if player_data.Slots[i].item.name == slot_.item.name:
					player_data.Slots[i].number += 1
					Global.item_on.emit(self)
					save_data()
					queue_free()
					return
		for i in player_data.Slots.size():
			if player_data.Slots[i].item == null:
				player_data.Slots[i].item = slot_.item
				player_data.Slots[i].number = 1
				Global.item_on.emit(self)
				save_data()
				queue_free()
				return
		queue_free()

func _process(delta: float) -> void:
	if !_can_move:
		global_position += speed * delta * move

func can_move():
	_can_move = false
	await get_tree().create_timer(0.5).timeout
	_can_move = true
	move = Vector2(0, 0)

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")


@export var rect: Rect2

func get_global_rect():
	return Rect2(
		global_position - rect.size / 2,
		rect.size
	)

func set_on_place():
	modulate.a = 1
