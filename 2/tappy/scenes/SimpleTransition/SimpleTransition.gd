extends Control


func _ready() -> void:
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_packed(GameManage.next_scene)
