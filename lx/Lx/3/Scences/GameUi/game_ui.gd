extends Control

@onready var label: Label = $MarginContainer/VBoxContainer2/Label
@onready var label_2: Label = $MarginContainer/VBoxContainer2/Label2
@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var attempts_label_2: Label = $MarginContainer/VBoxContainer/AttemptsLabel2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimalSignalHub._on_level_pass.connect(on_level_pass)
	label.hide()
	label_2.hide()
	level_label.text = "Level: " + str(AnimalScoreManager.level_a)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_level_pass():
	label.show()
	label_2.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://3/Scences/Main/main.tscn")
