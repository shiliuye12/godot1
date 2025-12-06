extends Control

@onready var label: Label = $MarginContainer/Label
@onready var game_over: Label = $GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SnakeSignalHub.on_score.connect(_on_score)
	SnakeSignalHub.on_game_over.connect(_on_game_over)
	game_over.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		pass

func _on_score():
	var _player = get_tree().get_first_node_in_group("player")
	label.text = "%04d" % _player.score

func _on_game_over():
	game_over.show()
	get_tree().paused = true
