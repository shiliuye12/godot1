extends Button

var xy_score = 400

func _on_pressed() -> void:
	if GoldChooseLevel.score >= xy_score:
		GoldChooseLevel.score -= xy_score
		queue_free()
		var money = randi_range(50, 1000)
		GoldChooseLevel.score += money

func _on_mouse_entered() -> void:
	GoldSignalHub.on_text.emit("随机获得50-1000元")
