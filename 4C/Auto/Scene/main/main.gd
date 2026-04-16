extends Node2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var bag_slot: Array = $CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/GridContainer.get_children()
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var slotitem = preload("res://Scene/SlotItem/slot_item.tscn")
@onready var grid_container: GridContainer = $Control
@onready var building: Node = $building
@onready var items: Node = $items
@onready var demolish: Button = $CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/Demolish
@onready var tech: Button = $CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/Tech
@onready var craft: Button = $CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/Craft
@onready var paused: Control = $CanvasLayer/paused
@onready var place: AudioStreamPlayer = $Sound/Place
@onready var control: GridContainer = $Control

var xz_sx = -1
var xz_sx_2 = -1
var in_demolish = false
var new_demolish

const OBJECT = preload("uid://dekjuuqtnx2lk")
const BAG_UI = preload("uid://dandknfb2b0qa")
const _BELT = preload("uid://b5caj17gdd36u")
const SAWMILL = preload("uid://rybyryv8q8n7")
const DEMOLISH = preload("uid://bqtco6n5pifjc")
const INLET = preload("uid://dvvgytqnygovj")
const CRAFT_UI = preload("uid://bwst6d627c8hh")
const FURNACE = preload("uid://i6uats16fvv4")
const MAKER = preload("uid://cnyqsuhkbnwxj")
const COMBINER = preload("uid://n6614d654tak")
const EXIT = preload("uid://c3e2v7o8sp3ot")
const SPLITTER = preload("uid://cdf684aferulb")
const TECH_TREE = preload("uid://cpw4kugn0gtx")
const RESIDENCE = preload("uid://0r1dmxfvvycs")
const GOVERNMENT_OFFICE = preload("uid://dyj8vvjvwoip0")
const BRIDGE = preload("uid://bt5qadqtyfs4v")
const IMPERIAL_PALACE = preload("uid://cdpgqnivfmoa0")

var gridSize: Vector2
var object
var targetCell
var objectCells
var isValid = false
var bag = null
var _rotation = 0
var craft_ui
var tech_tree = null

func _ready() -> void:
	kjl_update()
	Global.button_on.connect(_button_on)
	gridSize = Vector2(grid_container.cellWidth, grid_container.cellHeight)
	craft_ui = CRAFT_UI.instantiate()
	canvas_layer.add_child(craft_ui)
	craft_ui.visible = false

func kjl_update():
	for i in range(bag_slot.size()):
		if !player_data.Slots[i].item:
			if bag_slot[i].wp:
				bag_slot[i].wp.queue_free()
				bag_slot[i].wp = null
			continue
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		if player_data.Slots[i].number == 0:
			player_data.Slots[i].item = null
		bag_slot[i].wp.slot_ = player_data.Slots[i]
		bag_slot[i].wp.update()

func _button_on():
	var xz_gs = 0
	for i in range(bag_slot.size()):
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		if bag_slot[i].color_rect.visible == true:
			xz_gs += 1
			if xz_sx == -1:
				xz_sx = i
			else:
				if xz_sx == i:
					continue
				xz_sx_2 = i
	if xz_gs >= 2:
		if object:
			object.queue_free()
		object = null
		isValid = null
		_reset_highlight()
		slot_jh()
		Global.button_off.emit()

func slot_jh():
	object = null
	isValid = null
	var temp_slot: Slot = player_data.Slots[xz_sx]
	player_data.Slots[xz_sx] = player_data.Slots[xz_sx_2]
	player_data.Slots[xz_sx_2] = temp_slot
	xz_sx = -1
	xz_sx_2 = -1
	save_data()
	kjl_update()
	_rotation = 0
	
func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func _input(event: InputEvent) -> void:
	if xz_sx != -1 and not object and player_data.Slots[xz_sx].item:
		var newPlacement
		if player_data.Slots[xz_sx].item.name == "传送带" or \
		player_data.Slots[xz_sx].item.name == "锯木厂" or \
		player_data.Slots[xz_sx].item.name == "入货口" or \
		player_data.Slots[xz_sx].item.name == "熔炉" or \
		player_data.Slots[xz_sx].item.name == "合成器" or \
		player_data.Slots[xz_sx].item.name == "制造机" or \
		player_data.Slots[xz_sx].item.name == "出货口" or \
		player_data.Slots[xz_sx].item.name == "分流器" or \
		player_data.Slots[xz_sx].item.name == "民居1" or \
		player_data.Slots[xz_sx].item.name == "民居2" or \
		player_data.Slots[xz_sx].item.name == "民居3" or \
		player_data.Slots[xz_sx].item.name == "官府1" or \
		player_data.Slots[xz_sx].item.name == "官府2" or \
		player_data.Slots[xz_sx].item.name == "官府3" or \
		player_data.Slots[xz_sx].item.name == "桥梁1" or \
		player_data.Slots[xz_sx].item.name == "桥梁2" or \
		player_data.Slots[xz_sx].item.name == "桥梁3" or \
		player_data.Slots[xz_sx].item.name == "皇宫":
			if player_data.Slots[xz_sx].item:
				newPlacement = OBJECT.instantiate()
				add_child(newPlacement)
				newPlacement.slot_ = player_data.Slots[xz_sx]
				newPlacement.update()
				newPlacement.global_position = get_global_mouse_position()
				object = newPlacement
				object.rotation = _rotation
				control.visible = true
				if player_data.Slots[xz_sx].item.name == "制造机":
					object.rect.size = Vector2(150, 150)
				if player_data.Slots[xz_sx].item.name == "民居1":
					object.rect.size = Vector2(225, 225)
				if player_data.Slots[xz_sx].item.name == "民居2":
					object.rect.size = Vector2(225, 225)
				if player_data.Slots[xz_sx].item.name == "民居3":
					object.rect.size = Vector2(225, 225)
				if player_data.Slots[xz_sx].item.name == "官府1":
					object.rect.size = Vector2(300, 300)
				if player_data.Slots[xz_sx].item.name == "官府2":
					object.rect.size = Vector2(300, 300)
				if player_data.Slots[xz_sx].item.name == "官府3":
					object.rect.size = Vector2(300, 300)
				if player_data.Slots[xz_sx].item.name == "桥梁1":
					object.rect.size = Vector2(300, 150)
				if player_data.Slots[xz_sx].item.name == "桥梁2":
					object.rect.size = Vector2(300, 150)
				if player_data.Slots[xz_sx].item.name == "桥梁3":
					object.rect.size = Vector2(300, 150)
				if player_data.Slots[xz_sx].item.name == "皇宫":
					object.rect.size = Vector2(375, 375)
	elif Input.is_action_just_pressed("right") and isValid:
		_place_placement(objectCells)
	elif xz_sx != -1 and event.is_action_pressed("exit"):
		if object:
			object.queue_free()
			object = null
		isValid = null
		_reset_highlight()
		control.visible = false
		Global.button_off.emit()
		xz_sx = -1
		xz_sx_2 = -1
		_rotation = 0
	elif Input.is_action_just_pressed("bag") and not bag:
		bag = BAG_UI.instantiate()
		canvas_layer.add_child(bag)
	elif Input.is_action_just_pressed("exit") and bag:
		bag.queue_free()
		kjl_update()
		control.visible = false
		bag = null
	elif Input.is_action_just_pressed("exit") and tech_tree:
		tech_tree.queue_free()
		kjl_update()
		control.visible = false
		tech_tree = null
	elif in_demolish and Input.is_action_just_pressed("exit"):
		in_demolish = false
		new_demolish.queue_free()
		control.visible = false
		new_demolish = null
	elif Input.is_action_just_pressed("paused"):
		if craft_ui.visible == true or bag or tech_tree:
			return
		else:
			paused.visible = true
			get_tree().paused = true

func _get_target_cell(targetPosition):
	for child:Control in grid_container.get_children():
		if child.get_global_rect().has_point(targetPosition):
			return child

func _reset_highlight():
	for child:Control in grid_container.get_children():
		child.change_color(Color(0.5, 0.5, 0.5, 0.5))

func _get_target_cells():
	var cells = []
	
	for child:Control in grid_container.get_children():
		if child.get_global_rect().intersects(object.get_global_rect()):
			cells.append(child)
	return cells

func _check_and_hightlight_cells(objectCells: Array):
	var isValid = true
	var objectCellCount = 1 / ((object.rect.size.x / gridSize.x) * (object.rect.size.y / gridSize.y))
	#if objectCellCount != objectCells.size():
		#isValid = false
	for cell in objectCells:
		if cell.full:
			#isValid = false
			cell.change_color(Color.GREEN)
		else:
			cell.change_color(Color.GREEN)
	return isValid

func _place_placement(objectCells):
	var wz = object.global_position
	var a_rotation = object.rotation
	object.queue_free()
	if object.slot_.item.name == "传送带":
		object = _BELT.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "锯木厂":
		object = SAWMILL.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "入货口":
		object = INLET.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "熔炉":
		object = FURNACE.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "合成器":
		object = MAKER.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "制造机":
		object = COMBINER.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "出货口":
		object = EXIT.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "分流器":
		object = SPLITTER.instantiate()
		building.add_child(object)
	elif object.slot_.item.name == "民居1":
		object = RESIDENCE.instantiate()
		building.add_child(object)
		object.number = 1
		object.update_sprite()
	elif object.slot_.item.name == "民居2":
		object = RESIDENCE.instantiate()
		building.add_child(object)
		object.number = 2
		object.update_sprite()
	elif object.slot_.item.name == "民居3":
		object = RESIDENCE.instantiate()
		building.add_child(object)
		object.number = 3
		object.update_sprite()
	elif object.slot_.item.name == "官府1":
		object = GOVERNMENT_OFFICE.instantiate()
		building.add_child(object)
		object.number = 1
		object.update_sprite()
	elif object.slot_.item.name == "官府2":
		object = GOVERNMENT_OFFICE.instantiate()
		building.add_child(object)
		object.number = 2
		object.update_sprite()
	elif object.slot_.item.name == "官府3":
		object = GOVERNMENT_OFFICE.instantiate()
		building.add_child(object)
		object.number = 3
		object.update_sprite()
	elif object.slot_.item.name == "桥梁1":
		object = BRIDGE.instantiate()
		building.add_child(object)
		object.number = 1
		object.update_sprite()
	elif object.slot_.item.name == "桥梁2":
		object = BRIDGE.instantiate()
		building.add_child(object)
		object.number = 2
		object.update_sprite()
	elif object.slot_.item.name == "桥梁3":
		object = BRIDGE.instantiate()
		building.add_child(object)
		object.number = 3
		object.update_sprite()
	elif object.slot_.item.name == "皇宫":
		object = IMPERIAL_PALACE.instantiate()
		building.add_child(object)
		object.update_sprite()
	object.global_position = wz
	object.rotation = a_rotation
	if player_data.Slots[xz_sx].number <= 0:
		player_data.Slots[xz_sx].item = null
		player_data.Slots[xz_sx].number = 0
		if object:
			object.queue_free()
			object = null
		isValid = null
		_reset_highlight()
		Global.button_off.emit()
		xz_sx = -1
		xz_sx_2 = -1
		_rotation = 0
		save_data()
		return
	_rotation = object.rotation
	object.set_on_place()
	place.play()
	object = null
	isValid = null
	player_data.Slots[xz_sx].number -= 1
	if player_data.Slots[xz_sx].number <= 0:
		Global.button_off.emit()
		control.visible = false
	
	for cell in objectCells:
		cell.full = true
	
	_reset_highlight()
	save_data()

func _process(delta: float) -> void:
	kjl_update()
	if in_demolish:
		new_demolish.global_position = get_global_mouse_position()
	if not object: return
	var mousePosition = get_global_mouse_position()
	var newTargetCell = _get_target_cell(mousePosition)
	if Input.is_action_just_pressed("r"):
		object.rotation_degrees += 90.0
	
	if newTargetCell and newTargetCell != targetCell:
		targetCell = newTargetCell
		object.global_position = targetCell.global_position + object.rect.size/2
		
		_reset_highlight()
		objectCells = _get_target_cells()
		isValid = _check_and_hightlight_cells(objectCells)

func _on_demolish_pressed() -> void:
	in_demolish = true
	control.visible = true
	if new_demolish:
		new_demolish.queue_free()
		new_demolish = null
	new_demolish = DEMOLISH.instantiate()
	add_child(new_demolish)
	new_demolish.global_position = get_global_mouse_position()

func _on_craft_pressed() -> void:
	craft_ui.visible = true
	#ChangeScence.to_craft_ui()

func _on_tech_pressed() -> void:
	if tech_tree == null:
		tech_tree = TECH_TREE.instantiate()
		canvas_layer.add_child(tech_tree)

func _on_button_paused_pressed() -> void:
	paused.visible = false
	get_tree().paused = false
