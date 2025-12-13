extends Control

@onready var money: Label = $MarginContainer/VBoxContainer/money
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var time: Label = $MarginContainer/VBoxContainer2/time
@onready var level: Label = $MarginContainer/VBoxContainer2/level
@onready var timer: Timer = $Timer

var _time = 60
var mb_score = 0
var score = GoldChooseLevel.score

func _enter_tree() -> void:
	GoldSignalHub.on_score.connect(on_score)

func _ready() -> void:
	time.text = "时间：" + str(_time)
	level.text = "第 " + str(GoldChooseLevel.dq_level) + " 关"
	money.text = "金钱：" + str(score)
	mb_score = GoldChooseLevel.mb_score
	label.text = "目标钱数：" + str(mb_score)

func _process(delta: float) -> void:
	if _time <= 0:
		timer.stop()
		if score >= mb_score:
			if GoldChooseLevel.dq_level == 3:
				GoldSignalHub.tg = 1
				GoldChooseLevel.to_zhuanchang()
				GoldSignalHub.level_pass = 3
				return
			GoldSignalHub.level_pass = 1
			GoldSignalHub.on_save_score.emit(score)
			GoldChooseLevel.to_zhuanchang()
		else:
			GoldSignalHub.level_pass = 2
			GoldChooseLevel.to_zhuanchang()

func _on_timer_timeout() -> void:
	_time -= 1
	time.text = "时间：" + str(_time)

func _on_texture_button_pressed() -> void:
	GoldChooseLevel.to_zhuanchang()

func on_score(_score: int):
	score += _score
	money.text = "金钱：" + str(score)
