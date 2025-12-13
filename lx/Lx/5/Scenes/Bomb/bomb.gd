extends Button

var xy_score = 53

func _on_pressed() -> void:
	if GoldChooseLevel.score >= xy_score:
		GoldChooseLevel.score -= xy_score
		GoldChooseLevel.bomb_num += 1
		queue_free()


func _on_mouse_entered() -> void:
	GoldSignalHub.on_text.emit("按下s即可引爆当前抓取的物品")
