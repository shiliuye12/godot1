extends Button

var xy_score = 300

func _on_pressed() -> void:
	if GoldChooseLevel.score >= xy_score:
		GoldChooseLevel.score -= xy_score
		GoldChooseLevel.luck_num += 1
		queue_free()

func _on_mouse_entered() -> void:
	GoldSignalHub.on_text.emit("有%20的概率使得物品价值翻倍")
