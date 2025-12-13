extends Button

var xy_score = 800

func _on_pressed() -> void:
	if GoldChooseLevel.score >= xy_score:
		GoldChooseLevel.score -= xy_score
		GoldChooseLevel.book_num += 1
		queue_free()

func _on_mouse_entered() -> void:
	GoldSignalHub.on_text.emit("可以将石头价值提升至300")
