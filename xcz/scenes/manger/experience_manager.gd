extends Node
#管理经验

signal ex_updated(current_ex: float,target_ex: float)
signal level_up(new_level: int)

const TARGET_EX = 5

var current_ex = 0
var current_level = 1
var target_ex = 1

func _ready() -> void:
	GameEvents.ex_collected.connect(on_ex_collected)

func add_ex (number: float):
	current_ex = min(current_ex + number,target_ex)
	ex_updated.emit(current_ex,target_ex)
	if current_ex == target_ex:
		current_level += 1
		target_ex += TARGET_EX
		current_ex = 0
		ex_updated.emit(current_ex,target_ex)
		level_up.emit(current_level)
		
func on_ex_collected(number: float):
	add_ex(number)
