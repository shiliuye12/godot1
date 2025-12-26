extends Control

#region
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var mb_1: Sprite2D = $mb1
@onready var mb_2: Sprite2D = $mb2
@onready var zdui: Sprite2D = $zdui
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var _1: Sprite2D = $"ui/MarginContainer/HBoxContainer/VBoxContainer/1"
@onready var _3: Sprite2D = $"ui/MarginContainer/HBoxContainer/VBoxContainer/3"
@onready var _2: Sprite2D = $"ui/MarginContainer/HBoxContainer/VBoxContainer2/2"
@onready var _4: Sprite2D = $"ui/MarginContainer/HBoxContainer/VBoxContainer2/4"
@onready var ui: Sprite2D = $ui
@onready var jn_1: Sprite2D = $zdui/MarginContainer/jn_1
@onready var jn_3: Sprite2D = $zdui/MarginContainer/jn_3
@onready var jn_2: TextureRect = $zdui/MarginContainer/HBoxContainer3/jn_2
@onready var jn_4: TextureRect = $zdui/MarginContainer/HBoxContainer4/jn_4
@onready var marker_2d_1: Marker2D = $Marker2D1
@onready var marker_2d_2: Marker2D = $Marker2D2
@onready var player_name: Label = $mb1/MarginContainer/PlayerName
@onready var player_lv: Label = $mb1/MarginContainer/PlayerLV
@onready var player_hp: Label = $mb1/MarginContainer/PlayerHp
@onready var enemy_name: Label = $mb2/MarginContainer/EnemyName
@onready var enemy_lv: Label = $mb2/MarginContainer/EnemyLV
@onready var enemy_hp: Label = $mb2/MarginContainer/EnemyHp
@onready var move_1: Label = $zdui/MarginContainer/move1
@onready var move_3: Label = $zdui/MarginContainer/move3
@onready var move_2: Label = $zdui/MarginContainer/HBoxContainer3/move2
@onready var move_4: Label = $zdui/MarginContainer/HBoxContainer4/move4
@onready var type: Label = $zdui/MarginContainer2/VBoxContainer/type
@onready var pp: Label = $zdui/MarginContainer2/PP
@onready var jz: Sprite2D = $jz
@onready var zdks: Label = $jz/MarginContainer/HBoxContainer/zdks
@onready var jt: TextureRect = $jz/MarginContainer/HBoxContainer/jt
@onready var player_start: AnimatedSprite2D = $PlayerStart
@onready var player_hpui: Sprite2D = $mb1/MarginContainer/PlayerHpui
@onready var enemy_hpui: Sprite2D = $mb2/MarginContainer/EnemyHpui
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var ball: Sprite2D = $Ball

const HEALTH_BAR_0 = preload("uid://b7j1os4tq5etw")
const HEALTH_BAR_10 = preload("uid://rfdchq30snu8")
const HEALTH_BAR_20 = preload("uid://bpeugcqrom2p")
const HEALTH_BAR_30 = preload("uid://c5adgy0fxhbgs")
const HEALTH_BAR_40 = preload("uid://u5epe6rok6qf")
const HEALTH_BAR_50 = preload("uid://bj1vp3ofb11ux")
const HEALTH_BAR_60 = preload("uid://lgovnvk5h2ik")
const HEALTH_BAR_70 = preload("uid://da2g54xvrpw8s")
const HEALTH_BAR_80 = preload("uid://dxhf6xojevx4m")
const HEALTH_BAR_90 = preload("uid://ufq0k3b6f43k")
const HEALTH_BAR_100 = preload("uid://csa5g3aeoo11b")

const BB = preload("uid://bjtea7ulhngtk")
const POKEMON_BB = preload("uid://nhokmxdn7s4k")

#endregion

var bb_instance = null
var dj_bb_instance = null

var wz = 0
var hh_wz = 0
var _hhz = false
var can_gxhp = false

var player_dq_wg = 0.0
var player_dq_fy = 0.0
var player_dq_sd = 0.0
var enemy_dq_wg = 0.0
var enemy_dq_fy = 0.0
var enemy_dq_sd = 0.0

var sy_dj: bool = false

var player_pokemon_data = PlayerData.pokemon_load(1)
var player_pokemon = PokemonManager.Pokemon_instantiate(player_pokemon_data["id"])
var enemy_pokemon = PokemonManager.Pokemon_instantiate(randi_range(0, 2))

func _unhandled_input(event: InputEvent) -> void:	
	if zdui.visible == true and event.is_action_pressed("pokemon_qd") and wz <= player_pokemon.move_num:
		if player_pokemon.move_pp[wz - 1] > 0:
			player_pokemon.move_pp[wz - 1] -= 1
			move(wz)
	if event.is_action_pressed("pokemon_down") and wz <= 2 and wz != 0 and (ui.visible == true or zdui.visible == true):
		wz += 2
	if event.is_action_pressed("pokemon_left") and (wz == 2 or wz == 4) and (ui.visible == true or zdui.visible == true):
		wz -= 1
	if event.is_action_pressed("pokemon_right") and (wz == 1 or wz == 3) and (ui.visible == true or zdui.visible == true):
		wz += 1
	if event.is_action_pressed("pokemon_up") and wz > 2 and wz != 0 and (ui.visible == true or zdui.visible == true):
		wz -= 2
	if event.is_action_pressed("pokemon_qd") and ui.visible == true:
		qd()
	if event.is_action_pressed("exit") and zdui.visible == true:
		zdui.hide()
		ui.show()
		wz = 1
	if jz.visible == true and event.is_action_pressed("pokemon_qd") and _hhz == false:
		player_start.play("default")
		zdks.text = "就决定是你了 " + player_pokemon.pokemon_name
		mb_2.show()
	if event.is_action_pressed("exit") and bb_instance != null:
		bb_instance.queue_free()
		wz = 1
		ui.show()
	if event.is_action_pressed("exit") and dj_bb_instance != null:
		dj_bb_instance.queue_free()
		wz = 1
		ui.show()

func _ready() -> void:
	mb_1.hide()
	mb_2.hide()
	zdui.hide()
	move_2.text = "-"
	move_3.text = "-"
	move_4.text = "-"
	player_start.hide()
	jz.hide()
	ui.hide()
	zdui.hide()
	wz = 0
	PokemonSignalHub.on_dj.connect(on_dj)

func _process(_delta: float) -> void:
	if wz == 1:
		_1.show()
		_2.hide()
		_3.hide()
		_4.hide()
		jn_1.show()
		jn_2.hide()
		jn_3.hide()
		jn_4.hide()
		if zdui.visible == true:
			move_1.text = player_pokemon._move[player_pokemon.move1].name
			type.text = "属性/" + player_pokemon._move[player_pokemon.move1].type
			pp.text = str(player_pokemon.move_pp[0]) + "/" + str(player_pokemon._move[player_pokemon.move1].pp)
	elif wz == 2:
		_1.hide()
		_2.show()
		_3.hide()
		_4.hide()
		jn_1.hide()
		jn_2.show()
		jn_3.hide()
		jn_4.hide()
		if player_pokemon.move_num > 1 :
			if zdui.visible == true:
				move_2.text = player_pokemon._move[player_pokemon.move2].name
				type.text = "属性/" + player_pokemon._move[player_pokemon.move2].type
				pp.text = str(player_pokemon.move_pp[1]) + "/" + str(player_pokemon._move[player_pokemon.move2].pp)
		else:
			type.text = "属性/-"
			pp.text = "-"
	elif wz == 3:
		_1.hide()
		_2.hide()
		_3.show()
		_4.hide()
		jn_1.hide()
		jn_2.hide()
		jn_3.show()
		jn_4.hide()
		if player_pokemon.move_num > 2 :
			if zdui.visible == true:
				move_3.text = player_pokemon._move[player_pokemon.move3].name
				type.text = "属性/" + player_pokemon._move[player_pokemon.move3].type
				pp.text = str(player_pokemon.move_pp[2]) + "/" + str(player_pokemon._move[player_pokemon.move3].pp)
		else:
			type.text = "属性/-"
			pp.text = "-"
	elif wz == 4:
		_1.hide()
		_2.hide()
		_3.hide()
		_4.show()
		jn_1.hide()
		jn_2.hide()
		jn_3.hide()
		jn_4.show()
		if player_pokemon.move_num > 3 :
			if zdui.visible == true:
				move_4.text = player_pokemon._move[player_pokemon.move4].name
				type.text = "属性/" + player_pokemon._move[player_pokemon.move4].type
				pp.text = str(player_pokemon.move_pp[3]) + "/" + str(player_pokemon._move[player_pokemon.move4].pp)
		else:
			type.text = "属性/-"
			pp.text = "-"
	if can_gxhp:
		player_hp.text = str(player_pokemon.hp) + "/" + str(player_pokemon.max_hp)
		player_lv.text = "Lv:" + str(player_pokemon.level)
		enemy_hp.text = str(enemy_pokemon.hp) + "/" + str(enemy_pokemon.max_hp)
		enemy_lv.text = "Lv:" + str(enemy_pokemon.level)
		gx_hp()

func move(_wz: int):
	if player_pokemon.sd * (player_dq_sd + 1) >= enemy_pokemon.sd * (enemy_dq_sd + 1):
		hhz(_wz)
	else:
		enemy_hh()
		hh_wz = _wz

func qd():
	if wz == 1:
		ui.hide()
		zdui.show()
	elif wz == 2:
		ui.hide()
		zdui.hide()
		jz.hide()
		if not dj_bb_instance:
			dj_bb_instance = BB.instantiate()
			add_child(dj_bb_instance)
	elif wz == 3:
		ui.hide()
		zdui.hide()
		jz.hide()
		if not bb_instance:
			bb_instance = POKEMON_BB.instantiate()
			add_child(bb_instance)
	elif wz == 4:
		pass

func start():
	mb_2.show()

	player_pokemon.position = marker_2d_1.position
	enemy_pokemon.position = marker_2d_2.position
	player_pokemon.scale = Vector2(0,0)
	add_child(player_pokemon)
	add_child(enemy_pokemon)
	player_pokemon.a_level(player_pokemon_data["level"], player_pokemon_data["gtz"])
	enemy_pokemon.a_level(randi_range(enemy_pokemon.min_level, enemy_pokemon.max_level), randi_range(0, 32))
	player_name.text = player_pokemon.pokemon_name
	enemy_name.text = enemy_pokemon.pokemon_name
	player_lv.text = "Lv:" + str(player_pokemon_data["level"])
	enemy_lv.text = "Lv:" + str(enemy_pokemon.level)
	player_pokemon.move1 = player_pokemon_data["move"][0]
	player_pokemon.move_pp = player_pokemon_data["move_pp"]
	player_pokemon.wz = player_pokemon_data["wz"]
	move_1.text = player_pokemon._move[player_pokemon.move1].name
	if player_pokemon.move_num > 1:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		move_2.text = player_pokemon._move[player_pokemon.move2].name
	if player_pokemon.move_num > 2:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2]
		move_3.text = player_pokemon._move[player_pokemon.move3].name
	if player_pokemon.move_num > 3:
		player_pokemon.move1 = player_pokemon_data["move"][0]
		player_pokemon.move2 = player_pokemon_data["move"][1]
		player_pokemon.move3 = player_pokemon_data["move"][2]
		player_pokemon.move4 = player_pokemon_data["move"][3]
		move_4.text = player_pokemon._move[player_pokemon.move4].name
	
	player_pokemon.move_number = player_pokemon_data["move"]
	enemy_pokemon.mx()
	player_start.show()
	can_gxhp = true

func hhz(_wz: int):
	_hhz = true
	zdui.hide()
	ui.hide()
	jz.show()
	wz = 0
	zdks.text = player_pokemon.pokemon_name + "使用了" + player_pokemon._move[player_pokemon.move_number[_wz - 1]].name
	_sh(_wz, player_pokemon, enemy_pokemon)

func enemy_hh():
	_hhz = true
	zdui.hide()
	ui.hide()
	jz.show()
	wz = 0
	if enemy_pokemon.move_num < 4:
		var a = randi_range(0, enemy_pokemon.move_num - 1)
		zdks.text = enemy_pokemon.pokemon_name + "使用了" + enemy_pokemon._move[enemy_pokemon.move_number[a]].name
		_sh(a + 1, enemy_pokemon, player_pokemon)
	else:
		var a = randi_range(0, 3)
		zdks.text = enemy_pokemon.pokemon_name + "使用了" + enemy_pokemon._move[enemy_pokemon.move_number[a]].name
		_sh(a + 1, enemy_pokemon, player_pokemon)

func gx_hp():
	if player_pokemon.max_hp == 0 or enemy_pokemon.max_hp == 0:
		return
	
	if player_pokemon.hp*100 / player_pokemon.max_hp == 100:
		player_hpui.texture = HEALTH_BAR_100
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 90 and player_pokemon.hp*100 / player_pokemon.max_hp < 100:
		player_hpui.texture = HEALTH_BAR_90
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 80 and player_pokemon.hp*100 / player_pokemon.max_hp < 90:
		player_hpui.texture = HEALTH_BAR_80
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 70 and player_pokemon.hp*100 / player_pokemon.max_hp < 80:
		player_hpui.texture = HEALTH_BAR_70
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 60 and player_pokemon.hp*100 / player_pokemon.max_hp < 70:
		player_hpui.texture = HEALTH_BAR_60
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 50 and player_pokemon.hp*100 / player_pokemon.max_hp < 60:
		player_hpui.texture = HEALTH_BAR_50
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 40 and player_pokemon.hp*100 / player_pokemon.max_hp < 50:
		player_hpui.texture = HEALTH_BAR_40
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 30 and player_pokemon.hp*100 / player_pokemon.max_hp < 40:
		player_hpui.texture = HEALTH_BAR_30
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 20 and player_pokemon.hp*100 / player_pokemon.max_hp < 30:
		player_hpui.texture = HEALTH_BAR_20
	if player_pokemon.hp*100 / player_pokemon.max_hp >= 10 and player_pokemon.hp*100 / player_pokemon.max_hp < 20:
		player_hpui.texture = HEALTH_BAR_10
	if player_pokemon.hp*100 / player_pokemon.max_hp <= 0:
		player_hpui.texture = HEALTH_BAR_0
	
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp == 100:
		enemy_hpui.texture = HEALTH_BAR_100
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 90 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 100:
		enemy_hpui.texture = HEALTH_BAR_90
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 80 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 90:
		enemy_hpui.texture = HEALTH_BAR_80
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 70 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 80:
		enemy_hpui.texture = HEALTH_BAR_70
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 60 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 70:
		enemy_hpui.texture = HEALTH_BAR_60
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 50 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 60:
		enemy_hpui.texture = HEALTH_BAR_50
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 40 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 50:
		enemy_hpui.texture = HEALTH_BAR_40
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 30 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 40:
		enemy_hpui.texture = HEALTH_BAR_30
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 20 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 30:
		enemy_hpui.texture = HEALTH_BAR_20
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp >= 10 and enemy_pokemon.hp*100 / enemy_pokemon.max_hp < 20:
		enemy_hpui.texture = HEALTH_BAR_10
	if enemy_pokemon.hp*100 / enemy_pokemon.max_hp <= 0:
		enemy_hpui.texture = HEALTH_BAR_0

func jc_move(_wz: int , gj_pokemon: Node2D):
	if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx == "降低":
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "防御":
			if gj_pokemon == player_pokemon:
				enemy_dq_fy -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_fy -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "物攻":
			if gj_pokemon == player_pokemon:
				enemy_dq_wg -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_wg -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "速度":
			if gj_pokemon == player_pokemon:
				enemy_dq_sd -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_sd -= gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
	if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx == "提升":
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "防御":
			if gj_pokemon == player_pokemon:
				enemy_dq_fy += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_fy += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "物攻":
			if gj_pokemon == player_pokemon:
				enemy_dq_wg += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_wg += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx == "速度":
			if gj_pokemon == player_pokemon:
				enemy_dq_sd += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv
			else:
				player_dq_sd += gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx_lv

func enemy_die():
	enemy_pokemon.queue_free()
	enemy_dq_fy = 0
	enemy_dq_sd = 0
	enemy_dq_wg = 0

func player_die():
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	animation_player.play("jiazai")

func _on_player_start_animation_finished() -> void:
	var tween = create_tween()
	tween.tween_property(player_start, "position", Vector2(-100,353), 0.5)
	tween.tween_property(player_pokemon, "scale", Vector2(1,1), 0.5)
	mb_1.show()
	jz.hide()
	ui.show()
	wz = 1

func _on_timer_timeout() -> void:
	if player_pokemon.sd >= enemy_pokemon.sd:
		wz = 1
		if enemy_pokemon.hp > 0:
			enemy_hh()
		else:
			enemy_die()
			qiehuan()
			PlayerData.save(player_pokemon, player_pokemon.wz)
			zdks.text = "出现了新的宝可梦"
			enemy_pokemon.mx()
			await get_tree().create_timer(1).timeout
			wz = 1
			_hhz = false
			jz.hide()
			ui.show()
			hh_wz = 0
			can_gxhp = true
	else:
		wz = 1
		_hhz = false
		PlayerData.save(player_pokemon, player_pokemon.wz)
		jz.hide()
		ui.show()
		hh_wz = 0

func _on_timer_2_timeout() -> void:
	if player_pokemon.sd >= enemy_pokemon.sd:
		wz = 1
		_hhz = false
		PlayerData.save(player_pokemon, player_pokemon.wz)
		jz.hide()
		ui.show()
		hh_wz = 0
	else:
		if player_pokemon.hp > 0 and sy_dj == false:
			wz = 1
			hhz(hh_wz)
		elif sy_dj == true and player_pokemon.hp > 0:
			sy_dj = false
			wz = 1
			_hhz = false
			PlayerData.save(player_pokemon, player_pokemon.wz)
			jz.hide()
			ui.show()
			hh_wz = 0
		else:
			sy_dj = false
			PlayerData.save(player_pokemon, player_pokemon.wz)
			player_die()
			player_qiehuan()
			wz = 1
			_hhz = false
			jz.hide()
			ui.show()
			hh_wz = 0
			can_gxhp = true

func _sh(_wz: int, gj_pokemon: Node2D , fy_pokemon: Node2D):
	var power = 0
	if gj_pokemon == player_pokemon:
		power = gj_pokemon.wg * gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].power / float(fy_pokemon.fy * (1 + player_dq_wg)) / (enemy_dq_fy + 1)
	else:
		power = gj_pokemon.wg * gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].power / float(fy_pokemon.fy * (1 + enemy_dq_wg)) / (player_dq_fy + 1)
	var sx = PokemonMoveList.typekz(gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].type, fy_pokemon.type)
	var sx2 = PokemonMoveList.typekz(gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].type, fy_pokemon.type_2)
	var hx = randf_range(0, 1)
	if power == 0:
		jc_move(_wz, gj_pokemon)
		await get_tree().create_timer(1.0).timeout
		if gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx == "提升":
			zdks.text = gj_pokemon.pokemon_name + "的" + gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx + gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx + "了"
		elif gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx == "降低":
			zdks.text = fy_pokemon.pokemon_name + "的" + gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx_sx + gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx + "了"
		elif gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].lx == "dot":
			var _dot =PokemonMoveList.sj_dot(gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].name, fy_pokemon)
			if _dot == 1:
				var a =PokemonMoveList.jc_dot(gj_pokemon, fy_pokemon)
				zdks.text = fy_pokemon.pokemon_name + "处于" + a
				if gj_pokemon == player_pokemon:
					timer.start()
					return
				else :
					timer_2.start()
					return
			else :
				zdks.text = gj_pokemon.pokemon_name + "的" + gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].name + "失败了"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	
	var mz = randi_range(0, 100)
	if mz > gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].accuracy:
		zdks.text = "未命中"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	
	if hx <= 0.2:
		hx = 1.5
		power = gj_pokemon.wg * gj_pokemon._move[gj_pokemon.move_number[_wz - 1]].power / fy_pokemon.fy * (1 + player_dq_wg)
		fy_pokemon.hp -= power * sx * randf_range(0.9, 1.1) * hx * sx2
		if fy_pokemon.hp <= 0:
			fy_pokemon.hp = 0
		await get_tree().create_timer(1.0).timeout
		zdks.text = "击中要害"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	else:
		hx = 1
	
	fy_pokemon.hp -= power * sx * randf_range(0.9, 1.1) * hx * sx2
	if fy_pokemon.hp <= 0:
		fy_pokemon.hp = 0
	if sx == 2:
		await get_tree().create_timer(1.0).timeout
		zdks.text = "效果绝佳"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	if sx == 0.5:
		await get_tree().create_timer(1.0).timeout
		zdks.text = "效果不好"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	if sx == 0:
		await get_tree().create_timer(1.0).timeout
		zdks.text = "没有效果"
		pd_hh(gj_pokemon, fy_pokemon)
		return
	pd_hh(gj_pokemon, fy_pokemon)

func qiehuan():
	can_gxhp = false
	enemy_pokemon.queue_free()
	enemy_pokemon = PokemonManager.Pokemon_instantiate(randi_range(0, 2))
	enemy_pokemon.position = marker_2d_2.position
	enemy_name.text = enemy_pokemon.pokemon_name
	add_child(enemy_pokemon)
	enemy_pokemon.a_level(randi_range(enemy_pokemon.min_level, enemy_pokemon.max_level),  randi_range(0, 32))
	gx_hp()

func player_qiehuan():
	can_gxhp = false
	player_pokemon.queue_free()
	player_pokemon = PokemonManager.Pokemon_instantiate(0)
	player_pokemon.position = marker_2d_1.position
	player_name.text = player_pokemon.pokemon_name
	add_child(player_pokemon)
	player_pokemon.a_level(100, 20)
	gx_hp()

func pd_hh(gj_pokemon: Node2D, fy_pokemon:Node2D):
	if gj_pokemon == player_pokemon:
		if fy_pokemon.dq_dot_hh > 0:
			await get_tree().create_timer(1.0).timeout
			var a =PokemonMoveList.jc_dot(gj_pokemon, fy_pokemon)
			zdks.text = fy_pokemon.pokemon_name + "处于" + a
		timer.start()
	else :
		if fy_pokemon.dq_dot_hh > 0:
			await get_tree().create_timer(1.0).timeout
			var a =PokemonMoveList.jc_dot(gj_pokemon, fy_pokemon)
			zdks.text = fy_pokemon.pokemon_name + "处于" + a
		timer_2.start()

func on_dj(dj_name: String):
		dj_bb_instance.queue_free()
		wz = 1
		_hhz = true
		zdui.hide()
		ui.hide()
		jz.show()
		wz = 0
		zdks.text = "使用了" + dj_name
		sy_dj = true
		await get_tree().create_timer(1).timeout
		for i in DjList.ball_arr.size():
			var a = DjList.ball_arr[i].new()
			if dj_name == a.name:
				PlayerData.dj_sy(dj_name)
				var bzl = ((3 * enemy_pokemon.max_hp - 2 * enemy_pokemon.hp) * 200 * a.bzl) / (3 * enemy_pokemon.max_hp)
				var sfcg = randf_range(0, 1)
				if float(bzl) / 255.0 > sfcg:
					bz_animation(a.tp, a.tp2)
					await get_tree().create_timer(4).timeout
					zdks.text = "捕捉成功"
					PlayerData.save(enemy_pokemon, enemy_pokemon.wz)
					await get_tree().create_timer(1).timeout
					ball.hide()
					enemy_die()
					qiehuan()
					PlayerData.save(player_pokemon, player_pokemon.wz)
					zdks.text = "出现了新的宝可梦"
					enemy_pokemon.mx()
					await get_tree().create_timer(2).timeout
					wz = 1
					_hhz = false
					jz.hide()
					ui.show()
					hh_wz = 0
					can_gxhp = true
					return
				else:
					bz_animation(a.tp, a.tp2)
					await get_tree().create_timer(4).timeout
					bz_sb_animation(a.tp2)
					zdks.text = enemy_pokemon.pokemon_name + "挣脱了"
					await get_tree().create_timer(1).timeout
		for i in DjList.dj_arr.size():
			var a = DjList.dj_arr[i].new()
			if dj_name == a.name:
				PlayerData.dj_sy(dj_name)
				zdks.text = "恢复了" + str(a.hf) +"hp"
				player_pokemon.hp += a.hf
				if player_pokemon.hp > player_pokemon.max_hp:
					player_pokemon.hp = player_pokemon.max_hp
				gx_hp()
				await get_tree().create_timer(1).timeout
		enemy_hh()

func bz_animation(ball_texture1: Texture, ball_texture2: Texture):
	ball.show()
	ball.texture = ball_texture1
	animation_player.play("Ball_sy")
	await get_tree().create_timer(1).timeout
	ball.rotation_degrees = 0
	ball.texture = ball_texture2
	var tween = create_tween()
	tween.tween_property(enemy_pokemon, "scale", Vector2(0,0), 1)
	await tween.finished
	ball.texture = ball_texture1
	tween = create_tween()
	tween.set_loops(2)
	ball.rotation_degrees = 0
	tween.tween_property(ball, "rotation_degrees", -20, 0.3)
	tween.tween_property(ball, "rotation_degrees", 20, 0.3)
	tween.tween_property(ball, "rotation_degrees", 0, 0.3)

func bz_sb_animation(ball_texture: Texture):
	ball.texture = ball_texture
	var tween = create_tween()
	tween.tween_property(enemy_pokemon, "scale", Vector2(1, 1), 1)
	await tween.finished
	ball.hide()
