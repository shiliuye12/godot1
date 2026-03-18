extends Button

@onready var color_rect: ColorRect = $ColorRect

var wp: SlotItem

func _ready() -> void:
	Global.button_off.connect(_button_off)

func spawn(SI: SlotItem):
	wp = SI
	add_child(wp)

func _on_pressed() -> void:
	color_rect.show()
	Global.button_on.emit()

func _button_off():
	color_rect.hide()
