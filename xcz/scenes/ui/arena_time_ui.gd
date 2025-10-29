extends CanvasLayer

@export var arena_time_manager: Node
@onready var label: Label = %Label

#显示时间
func _process(delta):
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time()
	label.text = format_seconds_to_string(time_elapsed)

#输出时间
func format_seconds_to_string(seconds:float):
	var minutes = floori(seconds / 60)
	var remaining_seconds = seconds - (minutes * 60)
	return str(minutes)+ ":"+ ("%02d" % floori(remaining_seconds))
