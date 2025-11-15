extends Node

class_name Scorer

@onready var sound: AudioStreamPlayer = $Sound
@onready var reveal_timer: Timer = $RevealTimer

static var SelectionEnabled: bool = true
var _selections: Array[MemoryTile]
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0

func get_moves_made_str():
	return str(_moves_made)

func get_pairs_made_str():
	return "%d/%d" % [_pairs_made, _target_pairs]

func clear_new_game(target_pairs: int):
	_selections.clear()
	_target_pairs = target_pairs
	_moves_made = 0
	_pairs_made = 0
	SelectionEnabled = true

func _ready() -> void:
	SignalHub.on_tile_selected.connect(_on_tile_selected)
	SignalHub.on_game_exit_pressed.connect(_on_game_exit_pressed)
	
func _on_tile_selected(tile: MemoryTile):
	if tile in _selections:
		return
	
	_selections.append(tile)
	SoundManager.play_tile_click(sound)
	process_pair()

func check_for_pair():
	_moves_made += 1
	if _selections[0].matches_other_tile(_selections[1]) == true:
		_selections[0].kill_on_success()
		_selections[1].kill_on_success()
		_pairs_made += 1
		SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS)

func process_pair():
	if _selections.size() != 2:
		return
	SelectionEnabled = false
	reveal_timer.start()
	check_for_pair()
		

func _on_reveal_timer_timeout() -> void:
	for s in _selections:
		s.reveal(false)
	_selections.clear()
	check_game_over()

func _on_game_exit_pressed():
	reveal_timer.stop()

func check_game_over():
	if _pairs_made == _target_pairs:
		SelectionEnabled = false
		SignalHub.on_game_over.emit(_moves_made)
	else:
		SelectionEnabled = true
