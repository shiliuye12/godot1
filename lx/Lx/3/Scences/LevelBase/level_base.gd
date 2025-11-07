extends Node2D

const ANIMAL = preload("uid://bucc4wcdtko8b")
@onready var marker_2d: Marker2D = $Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimalSignalHub._on_animal_die.connect(on_anilam_die)
	spawn_animal()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_animal():
	var new_anilma = ANIMAL.instantiate()
	new_anilma.position = marker_2d.position
	add_child(new_anilma)

func on_anilam_die():
	spawn_animal()
