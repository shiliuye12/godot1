extends Button

@onready var color_rect: ColorRect = $ColorRect
@onready var color_rect_2: ColorRect = $ColorRect2
@onready var label: Label = $Label
@onready var name_label: Label = $Label

var wp: SlotItem

func _ready() -> void:
	Global.button_off.connect(_button_off)

func spawn(SI: SlotItem):
	wp = SI
	add_child(wp)

func _on_pressed() -> void:
	color_rect.show()
	color_rect_2.show()
	Global.button_on.emit()


func _button_off():
	color_rect.hide()
	color_rect_2.hide()
