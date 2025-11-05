extends TextureButton

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var level_num: String = "1"
@onready var label: Label = $MC/VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = level_num


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	animation_player.play("big")


func _on_mouse_exited() -> void:
	animation_player.play("s")


func _on_pressed() -> void:
	ScoreManage.level_number = level_num
	get_tree().change_scene_to_file("res://scenes/LevelBase/level_%s.tscn" % level_num)
