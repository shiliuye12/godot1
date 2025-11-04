extends Control

@onready var attemp_label: Label = $MarginContainer/VBoxContainer/Attemp_Label
@onready var v_bgameover: VBoxContainer = $MarginContainer/VBgameover
@onready var music: AudioStreamPlayer = $music

var _attemp = 0

func _ready() -> void:
	SignalHub.on_attempt_made.connect(_on_attempt_made)
	SignalHub.on_cup_die.connect(_on_cup_die)

func _on_attempt_made():
	_attemp += 1
	attemp_label.text = "attemp " + str(_attemp)

func _on_cup_die(remaining_cups: int):
	if remaining_cups == 0:
		v_bgameover.show()
		music.play()
