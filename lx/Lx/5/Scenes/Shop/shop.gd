extends Node2D

const BOMB = preload("uid://0vn1vrdadkku")
const MONEYDJ = preload("uid://dptnksnjbj67s")
const BOOK = preload("uid://ca73llm7ph5vy")
const LUCK = preload("uid://ct1tcov8ec3b2")
const WATER = preload("uid://ctqy5ahsnrc6g")

@onready var marker_2d_1: Marker2D = $Marker2D1
@onready var label_3: Label = $Label3
@onready var money: Label = $money
@onready var marker_2d_2: Marker2D = $Marker2D2
@onready var marker_2d_3: Marker2D = $Marker2D3
@onready var marker_2d_4: Marker2D = $Marker2D4

var item: Array = [MONEYDJ, BOMB, LUCK, WATER, BOOK]
var dq_book_num = 0
var dq_luck_num = 0
var dq_water_num = 0
var dj_num = 3

func _enter_tree() -> void:
	GoldSignalHub.on_text.connect(on_text)

func _on_texture_button_pressed() -> void:
	GoldChooseLevel.new_level()

func _ready() -> void:
	var new_bomb = BOMB.instantiate()
	new_bomb.position = marker_2d_1.position
	add_child(new_bomb)
	money.text = "当前金币：" + str(GoldChooseLevel.score)
	var dj = randi_range(1,3)
	for i in dj:
		if dq_book_num > 0 or GoldChooseLevel.book_num > 0:
			item.erase(BOOK)
			dj_num -= 1
		if dq_luck_num > 0 or GoldChooseLevel.luck_num > 0:
			item.erase(LUCK)
			dj_num -= 1
		if dq_water_num > 0:
			item.erase(WATER)
			dj_num -= 1
		var new_dj = item[randi_range(0, dj_num)]
		if new_dj == BOOK:
			dq_book_num += 1
		if new_dj == LUCK:
			dq_luck_num += 1
		if new_dj == WATER:
			dq_water_num += 1
		var _new_dj = new_dj.instantiate()
		if i == 0:
			_new_dj.position = marker_2d_2.position
		if i == 1:
			_new_dj.position = marker_2d_3.position
		if i == 2:
			_new_dj.position = marker_2d_4.position
		add_child(_new_dj)

func on_text(_text: String):
	label_3.text = _text

func _process(delta: float) -> void:
	money.text = "当前金币：" + str(GoldChooseLevel.score)
