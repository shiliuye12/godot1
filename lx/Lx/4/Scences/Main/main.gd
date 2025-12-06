extends Node2D

const PLAYER_BODY = preload("uid://c1bac7gfegcki")
const EX = preload("uid://br5tgbrtwswfk")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SnakeSignalHub.on_score.connect(_on_score)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		ChangeScences.change_scencce()

func _on_score():
	var new_body = PLAYER_BODY.instantiate()
	new_body.position = Vector2(-100 , 100)
	var _player = get_tree().get_first_node_in_group("player")
	new_body.a = _player.score + 1
	add_child(new_body)

func _on_timer_timeout() -> void:
	var new_ex = EX.instantiate()
	var _x = randi_range(1,28)
	var _y = randi_range(1,16)
	new_ex.position = Vector2(_x * 40, _y * 40)
	add_child(new_ex)
