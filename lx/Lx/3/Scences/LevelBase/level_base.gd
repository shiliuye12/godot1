extends Node2D

const ANIMAL = preload("uid://bucc4wcdtko8b")
@onready var marker_2d: Marker2D = $Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimalSignalHub._on_animal_die.connect(on_anilam_die)
	spawn_animal()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Cup.cup_number == 0:
		AnimalSignalHub._on_level_pass.emit()

func spawn_animal():
	var new_animal = ANIMAL.instantiate()
	new_animal.position = marker_2d.position
	call_deferred("add_child", new_animal)

func on_anilam_die():
	spawn_animal()
