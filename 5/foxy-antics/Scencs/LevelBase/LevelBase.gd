extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.load_main()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
