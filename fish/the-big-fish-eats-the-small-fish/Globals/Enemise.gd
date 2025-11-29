extends Node

const ENEMY_1 = preload("uid://r1rxos5isqy5")
const ENEMY_2 = preload("uid://4tw8becelyvc")
const ENEMY_3 = preload("uid://cb17l8mt1y7uo")
const ENEMY_4 = preload("uid://dyma27s2d6h6r")
const ENEMY_5 = preload("uid://bqqo7rst2j6sa")
const ENEMY_6 = preload("uid://u6ehj46s0au3")
const ENEMY_7 = preload("uid://crcwrv15554yy")

var enemies: Array = []
var enemies_weight: float = 0

var enemy_1_weight = 100
var enemy_2_weight = 70
var enemy_3_weight = 50
var enemy_4_weight = 1
var enemy_5_weight = 1
var enemy_6_weight = 1
var enemy_7_weight = 1

func _ready() -> void:
	HubSignal.on_time.connect(on_time)
	
	enemies.append(ENEMY_1)
	enemies.append(ENEMY_2)
	enemies.append(ENEMY_3)
	enemies.append(ENEMY_4)
	enemies.append(ENEMY_5)
	enemies.append(ENEMY_6)
	enemies.append(ENEMY_7)
	
	
	#for enemy in enemies:
	#	var _enemy = enemy.instantiate()
	#	enemies_weight += _enemy.weight
	
	var i = 1
	for enemy in enemies:
		var _name = "enemy_%d_weight" % i
		enemies_weight += get(_name)
		i += 1
	
func add_enemy():
	var random_value: float = randf() * enemies_weight
	
	var c_weight: float = 0
	
	#for enemy in enemies:
	#	var _enemy = enemy.instantiate()
	#	c_weight += _enemy.weight
	#	if random_value <= c_weight:
	#		return enemy.instantiate()
	var i = 1
	for enemy in enemies:
		var _name = "enemy_%d_weight" % i
		c_weight += get(_name)
		if random_value <= c_weight:
			return enemy.instantiate()
		i += 1

func on_time(a:int):
	if enemy_1_weight > 50:
		enemy_1_weight -= 2
	if enemy_2_weight > 30 and a >= 5:
		enemy_2_weight -= 1
	if enemy_3_weight > 30 and a >= 5:
		enemy_3_weight -= 0.5
	if a <= 120:
		if a <= 50:
			enemy_4_weight += 3
		enemy_5_weight += 0.7
		enemy_6_weight += 0.6
		enemy_7_weight += 0.5
	
	enemies_weight = 0
	var i = 1
	for enemy in enemies:
		var _name = "enemy_%d_weight" % i
		enemies_weight += get(_name)
		i += 1
