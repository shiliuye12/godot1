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
const RESIDENCE_1 = preload("uid://cg22gredk5nck")
const RESIDENCE_2 = preload("uid://ctl3hxt1ytldw")
const RESIDENCE_3 = preload("uid://ct1lc51a5xhvd")
const GOVERNMENT_OFFICE_1 = preload("uid://dvalh8e01oxpx")
const GOVERNMENT_OFFICE_2 = preload("uid://sukqvo4awny8")
const GOVERNMENT_OFFICE_3 = preload("uid://cstgugm2h6uco")
const BRIDGE_1 = preload("uid://c4ayiodevna3j")
const BRIDGE_2 = preload("uid://l3s5ly34n7ol")
const BRIDGE_3 = preload("uid://b8y8qkcelfayh")
const IMPERIAL_PALACE = preload("uid://7ll00y01dn8a")


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
	if area is Residence:
		demolish_building = area
	if area is GovernmentOffice:
		demolish_building = area
	if area is Bridge:
		demolish_building = area
	if area is ImperialPalace:
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
	if area is Residence:
		demolish_building = null
	if area is GovernmentOffice:
		demolish_building = null
	if area is Bridge:
		demolish_building = null
	if area is ImperialPalace:
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
		if demolish_building is Residence:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 41 and demolish_building.number == 1:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 200
						save_data()
						return
					elif player_data.Slots[i].item.id == 42 and demolish_building.number == 2:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 200
						save_data()
						return
					elif player_data.Slots[i].item.id == 43 and demolish_building.number == 3:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 200
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					if demolish_building.number == 1:
						player_data.Slots[i].item = RESIDENCE_1
					elif demolish_building.number == 2:
						player_data.Slots[i].item = RESIDENCE_2
					elif demolish_building.number == 3:
						player_data.Slots[i].item = RESIDENCE_3
					PlayerFrz.frz -= 200
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is GovernmentOffice:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 44 and demolish_building.number == 1:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 500
						save_data()
						return
					elif player_data.Slots[i].item.id == 45 and demolish_building.number == 2:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 500
						save_data()
						return
					elif player_data.Slots[i].item.id == 46 and demolish_building.number == 3:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						PlayerFrz.frz -= 500
						save_data()
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					if demolish_building.number == 1:
						player_data.Slots[i].item = GOVERNMENT_OFFICE_1
					elif demolish_building.number == 2:
						player_data.Slots[i].item = GOVERNMENT_OFFICE_2
					elif demolish_building.number == 3:
						player_data.Slots[i].item = GOVERNMENT_OFFICE_3
					PlayerFrz.frz -= 500
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is Bridge:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 48 and demolish_building.number == 1:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						PlayerFrz.frz -= 1000
						return
					elif player_data.Slots[i].item.id == 49 and demolish_building.number == 2:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						PlayerFrz.frz -= 1000
						return
					elif player_data.Slots[i].item.id == 50 and demolish_building.number == 3:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						PlayerFrz.frz -= 1000
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					if demolish_building.number == 1:
						player_data.Slots[i].item = BRIDGE_1
					elif demolish_building.number == 2:
						player_data.Slots[i].item = BRIDGE_2
					elif demolish_building.number == 3:
						player_data.Slots[i].item = BRIDGE_3
					PlayerFrz.frz -= 1000
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					return
		if demolish_building is ImperialPalace:
			for i in player_data.Slots.size():
				if player_data.Slots[i].item:
					if player_data.Slots[i].item.id == 47:
						player_data.Slots[i].number += 1
						demolish_building.queue_free()
						demolish_building = null
						save_data()
						PlayerFrz.frz -= 10000
						return
			for i in player_data.Slots.size():
				if !player_data.Slots[i].item:
					player_data.Slots[i].item = IMPERIAL_PALACE
					player_data.Slots[i].number += 1
					demolish_building.queue_free()
					demolish_building = null
					save_data()
					PlayerFrz.frz -= 10000
					return
