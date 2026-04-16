extends Area2D
class_name Combiner

var items_data = {
	"number": 0,
	"slot":null
}
var items_data2 = {
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

@onready var recipe = preload("res://Resource/recipe_data.tres")
const BUILDING_UI = preload("uid://cxejupw44ks23")
const ITEM = preload("uid://dg2dt3330rsms")

func _ready() -> void:
	Global.recipe_change.connect(_recipe_change)
	for i in recipe.recipes.size():
		if recipe.recipes[i]:
			if recipe.recipes[i].outitem.name == "合成器":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "制造机":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "入货口":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "出货口":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "分流器":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "窗户":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "木梁":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铁质框架":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铜装饰品":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "民居主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "民居":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "加固地基":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "金属屋顶":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "高级墙体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "官府主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "官府":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "家具":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铁质窗户":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥墩":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥面":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥身":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁1":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁2":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁3":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "精密地基":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "精致墙体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "高级屋顶":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "皇宫主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "皇宫":
				recipes.append(recipe.recipes[i])

func _recipe_change():
	for i in recipe.recipes.size():
		if recipe.recipes[i]:
			if recipe.recipes[i].outitem.name == "合成器":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "制造机":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "入货口":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "出货口":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "分流器":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "窗户":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "木梁":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铁质框架":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铜装饰品":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "民居主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "民居":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "加固地基":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "金属屋顶":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "高级墙体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "官府主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "官府":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "家具":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "铁质窗户":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥墩":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥面":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥身":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁1":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁2":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "桥梁3":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "精密地基":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "精致墙体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "高级屋顶":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "皇宫主体":
				recipes.append(recipe.recipes[i])
			if recipe.recipes[i].outitem.name == "皇宫":
				recipes.append(recipe.recipes[i])

func _on_entry_body_entered(body: Node2D) -> void:
	if body is item:
		if items_data.slot == null:
			if items_data2.slot != null:
				if items_data2.slot.item.id == body.slot_.item.id:
					items_data.number += 1
					items_data.slot = body.slot_
					Global.items_change.emit(items_data)
					body.queue_free()
					return
		if items_data.slot != null:
			if items_data.slot.item != null:
				if items_data.slot.item.id == body.slot_.item.id:
					items_data.number += 1
					items_data.slot = body.slot_
					Global.items_change.emit(items_data)
					body.queue_free()
					return
				elif items_data2.slot == null:
					items_data2.number = 1
					items_data2.slot = body.slot_
					body.queue_free()
					return
				elif items_data2.slot != null:
					if items_data2.slot.item.id == body.slot_.item.id:
						items_data2.number += 1
						items_data2.slot = body.slot_
						Global.items_change.emit(items_data)
						body.queue_free()
						return
		elif items_data.slot == null:
			items_data.number = 1
			items_data.slot = body.slot_
			#Global.items_change.emit(items_data)
			body.queue_free()
			return

func can_enter(body: item):
	if items_data.slot:
		if body.id == items_data.slot.item.id:
			return true
		elif !items_data2.slot:
			return true
		elif body.id == items_data2.slot.item.id:
			return true
		else:
			return false
	elif items_data2.slot:
		return true
	else:
		items_data.number = 0
		items_data2.number = 0
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
	if items_data.slot and items_data2.slot:
		if items_data.slot.item and items_data2.slot.item:
			if items_data.slot.item.name == recipes[recipe_wz].inputitem1 \
			and items_data2.slot.item.name == recipes[recipe_wz].inputitem2 and craft:
				if items_data.number >= recipes[recipe_wz].inputCount1 and \
				items_data2.number >= recipes[recipe_wz].inputCount2:
					if out_item_data.number < 20:
						craft = false
						items_data.number -= recipes[recipe_wz].inputCount1
						items_data2.number -= recipes[recipe_wz].inputCount2
						timer.start()
					elif out_item_data.number >= 20:
						craft = false
			elif items_data.slot.item.name == recipes[recipe_wz].inputitem2 \
			and items_data2.slot.item.name == recipes[recipe_wz].inputitem1 and craft:
				if items_data.number >= recipes[recipe_wz].inputCount2 and \
				items_data2.number >= recipes[recipe_wz].inputCount1:
					if out_item_data.number < 20:
						craft = false
						items_data.number -= recipes[recipe_wz].inputCount2
						items_data2.number -= recipes[recipe_wz].inputCount1
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
	if items_data2.number <= 0:
		items_data2.number = 0
		items_data2.slot = null

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

func _on_entry_2_body_entered(body: Node2D) -> void:
	if body is item:
		if items_data.slot == null:
			if items_data2.slot != null:
				if items_data2.slot.item.id == body.slot_.item.id:
					items_data.number += 1
					items_data.slot = body.slot_
					Global.items_change.emit(items_data)
					body.queue_free()
					return
		if items_data.slot != null:
			if items_data.slot.item != null:
				if items_data.slot.item.id == body.slot_.item.id:
					items_data.number += 1
					items_data.slot = body.slot_
					Global.items_change.emit(items_data)
					body.queue_free()
					return
				elif items_data2.slot == null:
					items_data2.number = 1
					items_data2.slot = body.slot_
					body.queue_free()
					return
				elif items_data2.slot != null:
					if items_data2.slot.item.id == body.slot_.item.id:
						items_data2.number += 1
						items_data2.slot = body.slot_
						Global.items_change.emit(items_data)
						body.queue_free()
						return
		elif items_data.slot == null:
			items_data.number = 1
			items_data.slot = body.slot_
			#Global.items_change.emit(items_data)
			body.queue_free()
			return
