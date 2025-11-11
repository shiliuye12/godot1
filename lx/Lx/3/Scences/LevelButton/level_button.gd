extends TextureButton

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var label_2: Label = $MarginContainer/VBoxContainer/Label2

@export var level_x:int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(level_x)
	label_2.text = str(AnimalScoreManager._level_score.get_level_score(level_x))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	animation_player.play("new_animation")


func _on_button_down() -> void:
	AnimalScoreManager.level_a = level_x
	get_tree().change_scene_to_file(
		"res://3/Scences/LevelBase/level_%d.tscn" % level_x
		) 
