extends Control

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var label_3: Label = $Label3
@onready var timer_3: Timer = $Timer3

var tg = 0

func _ready() -> void:
	label.hide()
	label_2.hide()
	label_3.hide()
	if GoldSignalHub.tg == 1:
		label_3.show()
		timer_3.start()
	if GoldSignalHub.level_pass == 1 and tg == 0:
		label.show()
		timer.start()
		GoldSignalHub.level_pass = 2
	elif GoldSignalHub.level_pass == 2 and tg == 0:
		timer_2.start()
		label_2.show()

func _on_timer_timeout() -> void:
	GoldChooseLevel.to_shop()

func _on_timer_2_timeout() -> void:
	GoldChooseLevel.to_main()

func _on_timer_3_timeout() -> void:
	GoldChooseLevel.to_main()
