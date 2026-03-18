extends MarginContainer

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect
@onready var label: Label = $MarginContainer/Label

func _ready() -> void:
	pass

func set_tex(res: ItemResource):
	await _ready()
	texture_rect.texture = res.icon
	label.text = str(res.amount)
