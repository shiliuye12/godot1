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


var gridSize: Vector2
var object
var targetCell
var objectCells
var isValid = false
var bag = null
var _rotation = 0

func _ready() -> void:
	kjl_update()
	Global.button_on.connect(_button_on)
	gridSize = Vector2(grid_container.cellWidth, grid_container.cellHeight)

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
		if player_data.Slots[xz_sx].item.name == "传送带" or player_data.Slots[xz_sx].item.name == "伐木场" or player_data.Slots[xz_sx].item.name == "入货口":
			if player_data.Slots[xz_sx].item:
				newPlacement = OBJECT.instantiate()
				add_child(newPlacement)
				newPlacement.slot_ = player_data.Slots[xz_sx]
				newPlacement.update()
				newPlacement.global_position = get_global_mouse_position()
				object = newPlacement
				object.rotation = _rotation
	elif Input.is_action_just_pressed("right") and isValid:
		_place_placement(objectCells)
	if xz_sx != -1 and event.is_action_pressed("exit"):
		if object:
			object.queue_free()
			object = null
		isValid = null
		_reset_highlight()
		Global.button_off.emit()
		xz_sx = -1
		xz_sx_2 = -1
		_rotation = 0
	if Input.is_action_just_pressed("bag") and not bag:
		bag = BAG_UI.instantiate()
		canvas_layer.add_child(bag)
	if Input.is_action_just_pressed("exit") and bag:
		bag.queue_free()
		kjl_update()
		bag = null
	if in_demolish and Input.is_action_just_pressed("exit"):
		in_demolish = false
		new_demolish.queue_free()
		new_demolish = null

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
			cell.change_color(Color.RED)
		else:
			cell.change_color(Color.GREEN)
	return isValid

func _place_placement(objectCells):
	if object.slot_.item.name == "传送带" or "伐木场" or "入货口":
		var wz = object.global_position
		var a_rotation = object.rotation
		object.queue_free()
		if object.slot_.item.name == "传送带":
			object = _BELT.instantiate()
		elif object.slot_.item.name == "伐木场":
			object = SAWMILL.instantiate()
		elif object.slot_.item.name == "入货口":
			object = INLET.instantiate()
		building.add_child(object)
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
		save_data()
	_rotation = object.rotation
	object.set_on_place()
	object = null
	isValid = null
	player_data.Slots[xz_sx].number -= 1
	if player_data.Slots[xz_sx].number <= 0:
		Global.button_off.emit()
	
	for cell in objectCells:
		cell.full = true
	
	_reset_highlight()


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
	new_demolish = DEMOLISH.instantiate()
	add_child(new_demolish)
	new_demolish.global_position = get_global_mouse_position()
	
