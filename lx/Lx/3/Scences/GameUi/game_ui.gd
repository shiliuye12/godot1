extends Control

@onready var label: Label = $MarginContainer/VBoxContainer2/Label
@onready var label_2: Label = $MarginContainer/VBoxContainer2/Label2
@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var attempts_label_2: Label = $MarginContainer/VBoxContainer/AttemptsLabel2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimalSignalHub._on_level_pass.connect(on_level_pass)
	label.hide()
	label_2.hide()
	level_label.text = "Level: " + str(AnimalScoreManager.level_a)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attempts_label_2.text = "Attempts: " + str(AnimalScoreManager.level_score)

func on_level_pass():
	label.show()
	label_2.show()
	audio_stream_player.play()
	AnimalScoreManager.set_score(AnimalScoreManager.level_a,AnimalScoreManager.level_score)
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		AnimalScoreManager.level_score = 0
		get_tree().change_scene_to_file("res://3/Scences/Main/main.tscn")
		AnimalScoreManager.level_score = 0
