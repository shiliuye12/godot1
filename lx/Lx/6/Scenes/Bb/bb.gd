extends Control

@onready var title: Label = $MarginContainer/title
@onready var name_1: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer/name1
@onready var number_1: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer/number
@onready var name_2: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer2/name2
@onready var number_2: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer2/number2
@onready var name_3: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer3/name3
@onready var number_3: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer3/number3
@onready var name_4: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer4/name4
@onready var number_4: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer4/number4
@onready var name_5: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer5/name5
@onready var number_5: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer5/number5
@onready var name_6: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer6/name6
@onready var number_6: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer6/number6
@onready var name_7: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer7/name7
@onready var number_7: Label = $ColorRect2/MarginContainer/GridContainer/HBoxContainer7/number7
@onready var marker_2d: Marker2D = $ColorRect2/Marker2D
@onready var marker_2d_2: Marker2D = $ColorRect2/Marker2D2
@onready var marker_2d_3: Marker2D = $ColorRect2/Marker2D3
@onready var marker_2d_4: Marker2D = $ColorRect2/Marker2D4
@onready var marker_2d_5: Marker2D = $ColorRect2/Marker2D5
@onready var marker_2d_6: Marker2D = $ColorRect2/Marker2D6
@onready var marker_2d_7: Marker2D = $ColorRect2/Marker2D7
@onready var jt: Sprite2D = $ColorRect2/jt
@onready var tp: Sprite2D = $tp
@onready var ms: Label = $MarginContainer2/ms

var ball_num = 0
var dj_name: Array
var dj_num: Array
var wz = 1
var dj: Array

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_down"):
		if wz == dj.size():
			wz = 1
		else:
			wz += 1
	if event.is_action_pressed("pokemon_up"):
		if wz == 1:
			wz = dj.size()
		else:
			wz -= 1

func _ready() -> void:
	dj_name = [name_1, name_2, name_3, name_4, name_5, name_6, name_7]
	dj_num = [number_1, number_2, number_3, number_4, number_5, number_6, number_7]
	jz_ball()

func jz_ball():
	ball_num = 0
	for i in PlayerData.poke_ball_arr.size():
		if PlayerData.poke_ball_arr[i] != 0:
			dj_name[i].show()
			dj_num[i].show()
			ball_num += 1
			var ball = DjList.ball_arr[i].new()
			dj_name[i].text = ball.name
			dj_num[i].text = "X" + str(PlayerData.poke_ball_arr[i])
			dj.append(ball)

func _process(delta: float) -> void:
	if wz == 1:
		jt.position = marker_2d.position
		tp.texture = dj[0].tp
		ms.text = dj[0].text
	if wz == 2:
		jt.position = marker_2d_2.position
		tp.texture = dj[1].tp
		ms.text = dj[1].text
	if wz == 3:
		jt.position = marker_2d_3.position
		tp.texture = dj[2].tp
		ms.text = dj[2].text
	if wz == 4:
		jt.position = marker_2d_4.position
		tp.texture = dj[3].tp
		ms.text = dj[3].text
	if wz == 5:
		jt.position = marker_2d_5.position
		tp.texture = dj[4].tp
		ms.text = dj[4].text
	if wz == 6:
		jt.position = marker_2d_6.position
		tp.texture = dj[5].tp
		ms.text = dj[5].text
	if wz == 7:
		jt.position = marker_2d_7.position
		tp.texture = dj[6].tp
		ms.text = dj[6].text
