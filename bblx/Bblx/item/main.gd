extends Node2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var bag_slot: Array = $CanvasLayer/MarginContainer/MarginContainer2/GridContainer\
.get_children()
@onready var player_date = preload("res://player_shuju.tres")
@onready var slotitem = preload("res://item/margin_container.tscn")
var xz_sx = -1
var xz_sx_2 = -1
@onready var grid_container: GridContainer = $GridContainer
const OBJECT = preload("uid://ct0n3lj5tb5ia")
const AREA_2D = preload("uid://x8wx0d75eaym")
const BAG_UI = preload("uid://u3s2h85nycu7")

var gridSize: Vector2
var object
var targetCell
var objectCells
var isValid = false
var bb
   
func _ready() -> void:
	kjl_update()
	Global.button_on.connect(_button_on)
	gridSize = Vector2(grid_container.cellWidth, grid_container.cellHeight)

func kjl_update():
	for i in range(bag_slot.size()):
		if !player_date.Slots[i].item:
			if bag_slot[i].wp:
				bag_slot[i].wp.queue_free()
				bag_slot[i].wp = null
			continue
		if !bag_slot[i].wp:
			var new_slot = slotitem.instantiate()
			bag_slot[i].spawn(new_slot)
		bag_slot[i].wp.slot_ = player_date.Slots[i]
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
	var temp_slot: Slot = player_date.Slots[xz_sx]
	player_date.Slots[xz_sx] = player_date.Slots[xz_sx_2]
	player_date.Slots[xz_sx_2] = temp_slot
	xz_sx = -1
	xz_sx_2 = -1
	save_data()
	kjl_update()
	
func save_data():
	ResourceSaver.save(player_date,"res://player_shuju.tres")

func _input(event: InputEvent) -> void:
	if xz_sx != -1 and not object:
		var newPlacement
		if player_date.Slots[xz_sx].item:
			if player_date.Slots[xz_sx].item.id == 5:
				newPlacement = AREA_2D.instantiate()
				add_child(newPlacement)
				newPlacement.global_position = get_global_mouse_position()
				object = newPlacement
			else:
				newPlacement = OBJECT.instantiate()
				add_child(newPlacement)
				newPlacement.slot_ = player_date.Slots[xz_sx]
				newPlacement.update()
				newPlacement.global_position = get_global_mouse_position()
				object = newPlacement
	elif Input.is_action_just_pressed("right_shubiao") and isValid:
		_place_placement(objectCells)
	if Input.is_action_just_pressed("bb") and not bb:
		bb = BAG_UI.instantiate()
		canvas_layer.add_child(bb)
	if Input.is_action_just_pressed("exit") and bb:
		bb.queue_free()
		kjl_update()
		bb = null
	

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
			isValid = false
			cell.change_color(Color.RED)
		else:
			cell.change_color(Color.GREEN)
	return isValid

func _place_placement(objectCells):
	object.set_on_place()
	object = null
	isValid = null
	
	for cell in objectCells:
		cell.full = true
	
	_reset_highlight()


func _process(delta: float) -> void:
	if not object: return
	var mousePosition = get_global_mouse_position()
	var newTargetCell = _get_target_cell(mousePosition)
	if Input.is_action_just_pressed("r"):
		object.rotation_degrees += 90
	
	if newTargetCell and newTargetCell != targetCell:
		targetCell = newTargetCell
		object.global_position = targetCell.global_position + object.rect.size/2
		
		_reset_highlight()
		objectCells = _get_target_cells()
		isValid = _check_and_hightlight_cells(objectCells)
