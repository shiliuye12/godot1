extends CanvasLayer

@export var ex_manger : Node
@onready var progress_bar: ProgressBar = $MarginContainer/ProgressBar

func _ready() -> void:
	progress_bar.value = 0
	ex_manger.ex_updated.connect(on_ex_updated)
	
func on_ex_updated(current_ex: float,target_ex: float):
	var percent = current_ex / target_ex
	progress_bar.value = percent
