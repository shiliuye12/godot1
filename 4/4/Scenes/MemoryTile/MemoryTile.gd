extends TextureButton

class_name MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage

func _ready() -> void:
	reveal(false)

func reveal(r: bool):
	frame_image.visible = r
	item_image.visible = r

func setup(frame: Texture2D, image: Texture2D):
	frame_image.texture = frame
	item_image.texture = image

func _on_pressed() -> void:
	if Scorer.SelectionEnabled == true:
		reveal(true)
		SignalHub.on_tile_selected.emit(self)
		

func matches_other_tile(other: MemoryTile):
	return other != self and other.item_image.texture == item_image.texture     

func kill_on_success():
	z_index = 1
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation_degrees", 360, 0.5)
	tween.tween_property(self, "scale", Vector2(1.5,1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self, "scale", Vector2.ZERO, 0)
	
	
