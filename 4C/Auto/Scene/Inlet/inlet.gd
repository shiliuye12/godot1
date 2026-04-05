extends Area2D
class_name Inlet

@onready var player_data = preload("res://Resource/player_data.tres")
const PLANK = preload("uid://bfikprf6d5njv")
const WOOD = preload("uid://bjlnyb4651vrl")
const STONE = preload("uid://csjn7qaau0ubx")
const STONR_BRICK = preload("uid://cmblb11l57k1y")
const COPPER = preload("uid://s11cs376uh5i")
const COPPER_BAR = preload("uid://ckakcgebnc4bu")
const IRON = preload("uid://vos8ovf5rvc7")
const IRON_BAR = preload("uid://dw7rhdh1mclgr")

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
				elif body.slot_.item.id == 6:
					player_data.Slots[i].item = STONE
				elif body.slot_.item.id == 8:
					player_data.Slots[i].item = STONR_BRICK
				elif body.slot_.item.id == 9:
					player_data.Slots[i].item = IRON
				elif body.slot_.item.id == 10:
					player_data.Slots[i].item = COPPER
				elif body.slot_.item.id == 11:
					player_data.Slots[i].item = IRON_BAR
				elif body.slot_.item.id == 12:
					player_data.Slots[i].item = COPPER_BAR
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
