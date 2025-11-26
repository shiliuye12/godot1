extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color("#fff", 1.0), 0.8)
