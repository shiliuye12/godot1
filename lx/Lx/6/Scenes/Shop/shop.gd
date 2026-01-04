extends Control

const XX_POKEMON_BB = preload("uid://byc1b2qkel8os")

@onready var money: Label = $MarginContainer/money
@onready var jt_1: TextureRect = $GridContainer/VBoxContainer/jt1
@onready var jt_2: TextureRect = $GridContainer/VBoxContainer2/jt2
@onready var jt_3: TextureRect = $GridContainer/VBoxContainer3/jt3
@onready var jt_4: TextureRect = $GridContainer/VBoxContainer4/jt4
@onready var jt_5: TextureRect = $GridContainer/VBoxContainer5/jt5
@onready var jt_6: TextureRect = $GridContainer/VBoxContainer6/jt6
@onready var jt_7: TextureRect = $GridContainer/VBoxContainer7/jt7
@onready var jt_8: TextureRect = $GridContainer/VBoxContainer8/jt8

var xx_bb = null
var wz = 1
var in_shop = true
var jg: Array = [30, 80, 180, 500, 50, 100, 200, 2000]
var dj: Array

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_f"):
		PokemonScenesChoose.to_pokemon_vs()
	if event.is_action_pressed("Pokemon_p"):
		if not xx_bb:
			xx_bb = XX_POKEMON_BB.instantiate()
			in_shop = false
			add_child(xx_bb)
	if event.is_action_pressed("exit") and xx_bb != null:
		xx_bb.queue_free()
		wz = 1
		in_shop = true
	if wz <= 4 and event.is_action_pressed("pokemon_down"):
		wz += 4
	elif wz % 4 == 1 and event.is_action_pressed("pokemon_left"):
		wz += 3
	elif wz % 4 == 0 and event.is_action_pressed("pokemon_right"):
		wz -= 3
	elif wz >= 5 and event.is_action_pressed("pokemon_up"):
		wz -= 4
	elif event.is_action_pressed("pokemon_right"):
		wz += 1
	elif event.is_action_pressed("pokemon_left"):
		wz -= 1
	if event.is_action_pressed("pokemon_qd") and in_shop:
		if PlayerData.coin >= jg[wz - 1]:
			PlayerData.coin -= jg[wz - 1]
			PlayerData.dj_tj(dj[wz - 1].name)

func _process(_delta: float) -> void:
	money.text = "金币数量: " + str(PlayerData.coin)
	if wz == 1:
		jt_1.show()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		jt_5.hide()
		jt_6.hide()
		jt_7.hide()
		jt_8.hide()
	if wz == 2:
		jt_1.hide()
		jt_2.show()
		jt_3.hide()
		jt_4.hide()
		jt_5.hide()
		jt_6.hide()
		jt_7.hide()
		jt_8.hide()
	if wz == 3:
		jt_1.hide()
		jt_2.hide()
		jt_3.show()
		jt_4.hide()
		jt_5.hide()
		jt_6.hide()
		jt_7.hide()
		jt_8.hide()
	if wz == 4:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.show()
		jt_5.hide()
		jt_6.hide()
		jt_7.hide()
		jt_8.hide()
	if wz == 5:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		jt_5.show()
		jt_6.hide()
		jt_7.hide()
		jt_8.hide()
	if wz == 6:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		jt_5.hide()
		jt_6.show()
		jt_7.hide()
		jt_8.hide()
	if wz == 7:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		jt_5.hide()
		jt_6.hide()
		jt_7.show()
		jt_8.hide()
	if wz == 8:
		jt_1.hide()
		jt_2.hide()
		jt_3.hide()
		jt_4.hide()
		jt_5.hide()
		jt_6.hide()
		jt_7.hide()
		jt_8.show()

func _ready() -> void:
	for i in DjList.dj_arr.size():
		var a = DjList.dj_arr[i].new()
		dj.append(a)
	for i in DjList.ball_arr.size():
		var a = DjList.ball_arr[i].new()
		dj.append(a)
