extends Control

@onready var sound: AudioStreamPlayer = $Sound
@onready var tile_grid: GridContainer = $HB/TileGrid
@onready var scorer: Scorer = $Scorer
@onready var moves_label: Label = $HB/MC/VBoxContainer/HBoxContainer/MovesLabel
@onready var pairs_label: Label = $HB/MC/VBoxContainer/HBoxContainer2/PairsLabel

const MEMORY_TILE = preload("uid://bqnf7gbd5lpy3")

func _on_exit_button_pressed() -> void:
	for t in tile_grid.get_children():
		t.queue_free()
	SoundManager.play_button_click(sound)
	SignalHub.on_game_exit_pressed.emit()

func _ready() -> void:
	SignalHub.on_level_selected.connect(_on_level_selected)

func add_memory_tile(frame: Texture2D, image: Texture2D):
	var mt = MEMORY_TILE.instantiate()
	tile_grid.add_child(mt)
	mt.setup(image, frame)

func _on_level_selected(level_num: int):
	var lds: LevelDataSelector = LevelDataSelector.get_level_selector(level_num)
	var fi: Texture2D = ImageManager.get_random_frame_image()
	tile_grid.columns = lds.get_num_cols()
	for im in lds.get_selected_images():
		add_memory_tile(im, fi)
	scorer.clear_new_game(lds.get_target_pairs())

func _process(delta: float) -> void:
	moves_label.text = scorer.get_moves_made_str()
	pairs_label.text = scorer.get_pairs_made_str()
