extends Button

var xy_score = 331

func _on_pressed() -> void:
	if GoldChooseLevel.score >= xy_score:
		GoldChooseLevel.score -= xy_score
		GoldChooseLevel.water_num += 1
		queue_free()

func _on_mouse_entered() -> void:
	GoldSignalHub.on_text.emit("下一关钩爪速度翻倍")
