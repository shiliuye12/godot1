extends Node2D

class_name Game

const EXPLODE = preload("uid://bnca12ghgufvh")
const GEM = preload("uid://c1ycuyvyipwol")
@onready var timer: Timer = $Timer
@onready var paddle: Area2D = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var sound: AudioStreamPlayer = $Sound
@onready var score_label: Label = $ScoreLabel

var score = 0
static var vp_r: Rect2

func _ready() -> void:
	up_vpr()
	get_viewport().size_changed.connect(up_vpr)
	spawn_gem()

static func get_vpr() -> Rect2:
	return vp_r

func up_vpr():
	vp_r = get_viewport_rect()

func spawn_gem():
	var new_gem: Gem = GEM.instantiate()
	var x_pos = randf_range(
		vp_r.position.x + 50,
		vp_r.end.x - 50)
	new_gem.position = Vector2(x_pos,-50)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gem)

func stop_all():
	sound.stop()
	sound.stream = EXPLODE
	sound.play()
	timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is Gem:
			child.set_process(false)


func _on_paddle_area_entered(area: Area2D) -> void:
	score += 1
	score_label.text = "%03d" % score

	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()


func _on_timer_timeout() -> void:
	spawn_gem()

func _on_gem_off_screen():
	stop_all()
