extends Control

@onready var game_over: Label = $GameOver
@onready var pause: Label = $Pause

func _enter_tree() -> void:
	Signalhub.plane_die.connect(_die)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit") and game_over.visible == false:
		GameManager.lode_main()

func _die():
	game_over.visible = true
	await get_tree().create_timer(1).timeout
	game_over.visible = false
	pause.visible = true
