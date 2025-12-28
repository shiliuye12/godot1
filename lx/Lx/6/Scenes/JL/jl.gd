extends Control

@onready var jt_1: TextureRect = $GridContainer/VBoxContainer/jt1
@onready var jt_2: TextureRect = $GridContainer/VBoxContainer2/jt2
@onready var jt_3: TextureRect = $GridContainer/VBoxContainer3/jt3
@onready var tp_1: TextureRect = $GridContainer/VBoxContainer/tp1
@onready var tp_2: TextureRect = $GridContainer/VBoxContainer2/tp2
@onready var tp_3: TextureRect = $GridContainer/VBoxContainer3/tp3
@onready var label_1: Label = $GridContainer/VBoxContainer/Label1
@onready var label_2: Label = $GridContainer/VBoxContainer2/Label2
@onready var label_3: Label = $GridContainer/VBoxContainer3/Label3

const XX_POKEMON_BB = preload("uid://byc1b2qkel8os")

var wz = 1
var z_wz = 3
var dj: Array
var dj_int: Array
var dj_weight: Array
var dj_weight_z: int = 0
var _dj_weight_z: int = 0
var dj_1: int = 0
var dj_2: int = 0
var dj_3: int = 0
var xx_bb = null

var in_jl = true

func _ready() -> void:
	for i in DjList.ball_arr.size():
		var a = DjList.ball_arr[i].new()
		dj.append(a)
		dj_weight.append(a.weight)
	for i in DjList.dj_arr.size():
		var a = DjList.dj_arr[i].new()
		dj.append(a)
		dj_weight.append(a.weight)
	for i in DjList.qt_arr.size():
		var a = DjList.qt_arr[i].new()
		dj.append(a)
		dj_weight.append(a.weight)
	for i in dj_weight.size():
		dj_weight_z += dj_weight[i]
	dj_1 = randi_range(0, dj_weight_z)
	dj_2 = randi_range(0, dj_weight_z)
	dj_3 = randi_range(0, dj_weight_z)
	for i in dj_weight.size():
		_dj_weight_z += dj_weight[i]
		if dj_1 <= _dj_weight_z:
			dj_int.append(i)
		if dj_2 <= _dj_weight_z:
			dj_int.append(i)
		if dj_3 <= _dj_weight_z:
			dj_int.append(i)
	tp_1.texture = dj[dj_int[0]].tp
	tp_2.texture = dj[dj_int[1]].tp
	tp_3.texture = dj[dj_int[2]].tp
	label_1.text = dj[dj_int[0]].name
	label_2.text = dj[dj_int[1]].name
	label_3.text = dj[dj_int[2]].name
	if dj_int[0] == dj_int[1]:
		tp_2.hide()
		label_2.hide()
		z_wz -= 1
	if dj_int[1] == dj_int[2] or dj_int[2] == dj_int[0]:
		tp_3.hide()
		label_3.hide()
		z_wz -= 1
	if label_1.text == "金币":
		label_1.text = "金币 X 100"
	if label_2.text == "金币":
		label_2.text = "金币 X 100"
	if label_3.text == "金币":
		label_3.text = "金币 X 100"

func _unhandled_input(event: InputEvent) -> void:
	if wz <= 1 and event.is_action_pressed("pokemon_left"):
		wz = z_wz
	elif wz <= z_wz and event.is_action_pressed("pokemon_left"):
		wz -= 1
	elif wz < z_wz and event.is_action_pressed("pokemon_right"):
		wz += 1
	elif wz >= z_wz and event.is_action_pressed("pokemon_right"):
		wz = 1
	if event.is_action_pressed("Pokemon_p"):
		if not xx_bb:
			xx_bb = XX_POKEMON_BB.instantiate()
			in_jl = false
			add_child(xx_bb)
	if event.is_action_pressed("exit") and xx_bb != null:
		xx_bb.queue_free()
		wz = 1
		in_jl = true
	if event.is_action_pressed("pokemon_qd") and in_jl == true:
		if dj[wz].name != "金币":
			PlayerData.dj_tj(dj[wz].name)
		if dj[wz].name == "金币":
			PlayerData.coin += 100
		PokemonScenesChoose.to_shop()

func _process(_delta: float) -> void:
	if wz == 1:
		jt_1.show()
		jt_2.hide()
		jt_3.hide()
	if wz == 2:
		if tp_2.visible == true:
			jt_1.hide()
			jt_2.show()
			jt_3.hide()
		if tp_2.visible == false:
			jt_1.hide()
			jt_2.hide()
			jt_3.show()
	if wz == 3:
		jt_1.hide()
		jt_2.hide()
		jt_3.show()
