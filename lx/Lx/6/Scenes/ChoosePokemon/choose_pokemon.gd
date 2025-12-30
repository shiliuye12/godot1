extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_2: Marker2D = $Marker2D2
@onready var marker_2d_3: Marker2D = $Marker2D3
@onready var label: Label = $jz/MarginContainer/HBoxContainer/Label
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Sprite2D3
@onready var sprite_2d_4: Sprite2D = $Sprite2D4

const POKEMON_BB = preload("uid://nhokmxdn7s4k")

var wz = 0
var zt = "jz"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pokemon_left") and zt == "xz":
		if wz == 1:
			wz = 3
			return
		wz -= 1
	if event.is_action_pressed("pokemon_right") and zt == "xz":
		if wz == 3:
			wz = 1
			return
		wz += 1
	if event.is_action_pressed("pokemon_qd") and zt == "jz":
		await get_tree().create_timer(0.1).timeout
		zt = "xz"
		wz = 1
	if event.is_action_pressed("pokemon_qd") and zt == "xz":
		pass

func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(sprite_2d, "position:y", 110, 0.5)
	tween.tween_property(sprite_2d, "position:y", 75, 0.5)
	
func _process(_delta: float) -> void:
	if wz == 1:
		sprite_2d.position = marker_2d.position
		label.text = "就决定是你了 小火龙"
		sprite_2d_2.show()
		sprite_2d_3.hide()
		sprite_2d_4.hide()
		if Input.is_action_just_pressed("pokemon_qd"):
			var new = PokemonManager.Pokemon_instantiate(0)
			new.a_level(50, randi_range(0, 32))
			PlayerData.save(new, new.wz)
			PokemonScenesChoose.to_jl()
	if wz == 2:
		sprite_2d.position = marker_2d_2.position
		label.text = "就决定是你了 妙蛙种子"
		sprite_2d_2.hide()
		sprite_2d_3.show()
		sprite_2d_4.hide()
		if Input.is_action_just_pressed("pokemon_qd"):
			var new = PokemonManager.Pokemon_instantiate(1)
			new.a_level(5, randi_range(0, 32))
			PlayerData.save(new, new.wz)
			PokemonScenesChoose.to_pokemon_vs()
	if wz == 3:
		sprite_2d.position = marker_2d_3.position
		label.text = "就决定是你了 杰尼龟"
		sprite_2d_2.hide()
		sprite_2d_3.hide()
		sprite_2d_4.show()
		if Input.is_action_just_pressed("pokemon_qd"):
			var new = PokemonManager.Pokemon_instantiate(2)
			new.a_level(5, randi_range(0, 32))
			PlayerData.save(new, new.wz)
			PokemonScenesChoose.to_pokemon_vs()
