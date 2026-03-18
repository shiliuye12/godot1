extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
const WOOD = preload("uid://ccywdw1j5ses7")
var wood : ItemResource = WOOD

const ITEM = preload("uid://b75xwo35tqcnl")

@export var health : int = 3
var _can_hit = true
var item : ItemResource = WOOD

func hit():
	if health > 1:
		animation_player.play("hit")
		await animation_player.animation_finished
		health -= 1
		_can_hit = true
	else:
		die()

func die():
	animation_player.play("die")
	await animation_player.animation_finished
	queue_free()
	var new_wood = ITEM.instantiate()
	get_parent().add_child(new_wood)
	new_wood.global_position = global_position
	InventorySystem.add_item(wood)
	new_wood.die()
	await get_tree().create_timer(1).timeout
	new_wood.queue_free()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed() and _can_hit:
			hit()
			_can_hit = false
