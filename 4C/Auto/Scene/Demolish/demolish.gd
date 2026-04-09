extends Area2D
class_name Demolish

var demolish_building = null
@onready var player_data = preload("res://Resource/player_data.tres")

const BELT = preload("uid://dawvbko2ige0d")
const SAWMILL = preload("uid://cioy41cld7dg2")
const INLET = preload("uid://3q2pfsalrcvf")
const FURNACE = preload("uid://cpbsl2d5j73kl")
const MAKER = preload("uid://c1t6ygj6vty8m")
const COMBINER = preload("uid://c5k414gkua7aa")
const EXIT = preload("uid://ct2ritfh33hc")
const SPLITTER = preload("uid://div1q0ahx4bf0")

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _on_area_entered(area: Area2D) -> void:
	if area is Belt:
		demolish_building = area
	if area is Sawmill:
		demolish_building = area
	if area is Inlet:
		demolish_building = area
	if area is Furnace:
		demolish_building = area
	if area is Maker:
		demolish_building = area
	if area is Combiner:
		demolish_building = area
	if area is Exit:
		demolish_building = area
	if area is Splitter:
		demolish_building = area

	if area is Exit:
		demolish_building = area
	if area is Exit:
		demolish_building = area
	if area is Exit:
		demolish_building = area
	if area is Exit:
		demolish_building = area

func _on_area_exited(area: Area2D) -> void:
	if area is Belt:
		demolish_building = null
	if area is Sawmill:
		demolish_building = null
	if area is Inlet:
		demolish_building = null
	if area is Furnace:
		demolish_building = null
	if area is Maker:
		demolish_building = null
	if area is Combiner:
		demolish_building = null
	if area is Exit:
		demolish_building = null
	if area is Splitter:
		demolish_building = null

	if area is Exit:
		demolish_building = null
	if area is Exit:
		demolish_building = null
	if area is Exit:
		demolish_building = null
	if area is Exit:
		demolish_building = null

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if demolish_building and event.is_action_pressed("left"):
		if demolish_building is Belt:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 2:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = BELT
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Sawmill:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 3:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = SAWMILL
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Inlet:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 5:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = INLET
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Furnace:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 7:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = FURNACE
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Maker:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 13:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = MAKER
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Combiner:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 14:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = COMBINER
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Exit:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 15:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = EXIT
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Splitter:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 16:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = SPLITTER
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
