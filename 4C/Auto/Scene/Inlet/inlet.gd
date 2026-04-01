extends Area2D
class_name Inlet

@onready var player_data = preload("res://Resource/player_data.tres")
const PLANK = preload("uid://bfikprf6d5njv")
const WOOD = preload("uid://bjlnyb4651vrl")

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")


func _on_body_entered(body: Node2D) -> void:
	if body is item:
		for i in player_data.Slots.size():
			if player_data.Slots[i].item:
				if player_data.Slots[i].item.id == body.slot_.item.id:
					player_data.Slots[i].number += 1
					body.queue_free()
					save_data()
					return
		for i in player_data.Slots.size():
			if !player_data.Slots[i].item:
				if body.slot_.item.id == 1:
					player_data.Slots[i].item = WOOD
				elif body.slot_.item.id == 4:
					player_data.Slots[i].item = PLANK
				player_data.Slots[i].number += 1
				body.queue_free()
				save_data()
				return


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
