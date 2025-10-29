extends CanvasLayer

func switch_scenes():
	get_tree().change_scene_to_packed(GameManage.next_scene)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
