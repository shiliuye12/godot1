extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()

func _process(delta: float) -> void:
	var player_node = get_tree().get_nodes_in_group("player")
	if player_node.size() > 0:
		var player = player_node[0]
		global_position = player.global_position
