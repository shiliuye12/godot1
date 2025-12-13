extends Area2D

var shz = false
@export var weight = 0.5
@export var score = 10

func _ready() -> void:
	GoldSignalHub.on_grapple_position.connect(on_grapple_position)
	GoldSignalHub.on_daoda.connect(on_daoda)
	GoldSignalHub.on_bomb.connect(on_bomb)

func on_grapple_position(_pos: Vector2):
	if shz:
		global_position = _pos

func on_daoda():
	if shz:
		queue_free()
		GoldSignalHub.on_score.emit(score)
		if GoldChooseLevel.luck_num >= 0:
			var a = randf_range(0, 1)
			if a <= 0.2:
				GoldSignalHub.on_score.emit(score)

func _on_area_entered(area: Area2D) -> void:
	if area is Grapple:
		shz = true

func on_bomb():
	if shz:
		queue_free()
