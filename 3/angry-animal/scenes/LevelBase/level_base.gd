extends Node2D

const ANIMAL = preload("uid://duayv708jkwnk")
@onready var marker_2d: Marker2D = $Marker2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Water/AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_animal()


func _enter_tree() -> void:
	SignalHub.on_animal_dide.connect(spawn_animal)

func spawn_animal():
	var new_animal = ANIMAL.instantiate()
	new_animal.position = marker_2d.position
	add_child(new_animal)
