extends TextureButton

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var level_num: String = "1"
@onready var label: Label = $MC/VBoxContainer/Label
@onready var label_2: Label = $MC/VBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = level_num
	label_2.text = str(ScoreManage.get_level_best(level_num))


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
