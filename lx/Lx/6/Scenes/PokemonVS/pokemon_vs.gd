extends Control

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
@onready var jn_2: Sprite2D = $zdui/MarginContainer/jn_2
@onready var jn_4: Sprite2D = $zdui/MarginContainer/jn_4
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
@onready var move_2: Label = $zdui/MarginContainer/move2
@onready var move_4: Label = $zdui/MarginContainer/move4
@onready var type: Label = $zdui/MarginContainer2/VBoxContainer/type
@onready var pp: Label = $zdui/MarginContainer2/PP

var wz = 0

var player_pokemon = PokemonManager.Pokemon_instantiate(0)
var enemy_pokemon = PokemonManager.Pokemon_instantiate(1)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_down") and wz <= 2 and wz != 0:
		wz += 2
	if event.is_action_pressed("pokemon_left") and (wz == 2 or wz == 4):
		wz -= 1
	if event.is_action_pressed("pokemon_right") and (wz == 1 or wz == 3):
		wz += 1
	if event.is_action_pressed("pokemon_up") and wz > 2 and wz != 0:
		wz -= 2
	if event.is_action_pressed("pokemon_qd"):
		qd()
	if event.is_action_pressed("exit") and zdui.visible == true:
		zdui.hide()
		ui.show()
		wz = 1

func _ready() -> void:
	mb_1.hide()
	mb_2.hide()
	zdui.hide()
	move_2.text = "-"
	move_3.text = "-"
	move_4.text = "-"

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
			pp.text = str(player_pokemon._move[player_pokemon.move1].pp) + "/" + str(player_pokemon._move[player_pokemon.move1].pp)
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
				pp.text = str(player_pokemon._move[player_pokemon.move2].pp) + "/" + str(player_pokemon._move[player_pokemon.move2].pp)
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
				pp.text = str(player_pokemon._move[player_pokemon.move3].pp) + "/" + str(player_pokemon._move[player_pokemon.move3].pp)
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
				pp.text = str(player_pokemon._move[player_pokemon.move4].pp) + "/" + str(player_pokemon._move[player_pokemon.move4].pp)
		else:
			type.text = "属性/-"
			pp.text = "-"

func qd():
	if wz == 1:
		ui.hide()
		zdui.show()
	elif wz == 2:
		pass
	elif wz == 3:
		pass
	elif wz == 4:
		pass

func start():
	mb_1.show()
	mb_2.show()

	player_pokemon.position = marker_2d_1.position
	enemy_pokemon.position = marker_2d_2.position
	add_child(player_pokemon)
	add_child(enemy_pokemon)
	player_name.text = player_pokemon.pokemon_name
	enemy_name.text = enemy_pokemon.pokemon_name
	player_hp.text = str(player_pokemon.hp) + "/" + str(player_pokemon.max_hp)
	player_lv.text = "Lv:" + str(player_pokemon.level)
	
	move_1.text = player_pokemon._move[player_pokemon.move1].name
	if player_pokemon.move_num > 1:
		move_2.text = player_pokemon._move[player_pokemon.move2].name
	if player_pokemon.move_num > 2:
		move_3.text = player_pokemon._move[player_pokemon.move3].name
	if player_pokemon.move_num > 3:
		move_4.text = player_pokemon._move[player_pokemon.move4].name

func _on_animated_sprite_2d_animation_finished() -> void:
	animation_player.play("jiazai")
	wz = 1
