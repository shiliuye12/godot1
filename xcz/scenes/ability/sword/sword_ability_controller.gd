extends Node

@export var max_range: float = 150.0#攻击范围
@export var sword_ability: PackedScene
var base_damage = 5
var additional_damage_percent = 1
var base_wait_time

#开始时输出倒计时信号
func _ready() -> void:
	base_wait_time = $Timer.wait_time
	$Timer.timeout
	GameEvents.ability_upgrade_added.connect(on_ability_upgrade_added)


func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		
	var enemies = get_tree().get_nodes_in_group("enemy")
	#将玩家攻击范围外的敌人过滤
	enemies = enemies.filter(func(enemy:Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(max_range,2)
	)
	if enemies.size() == 0:
		return
	#比较敌人与自身的距离
	enemies.sort_custom(func(a:Node2D,b:Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
	
	var sword_instance = sword_ability.instantiate() as SwordAbility#创建一个实例
	var foreground_layer = get_tree().get_first_node_in_group("foreground_layer")
	foreground_layer.add_child(sword_instance)#将实例作为子节点添加到主场景
	sword_instance.hitbox_component.damage = base_damage * additional_damage_percent
	
	sword_instance.global_position = enemies[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0,TAU)) *4#将武器生成在敌人附近
	
	var enemy_disrection = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_disrection.angle()

func on_ability_upgrade_added(upgade: AbilityUpgrade,current_upgrade: Dictionary):
	if upgade.id == "sword_rate":
		var percent_reduction = current_upgrade["sword_rate"]["quantity"] * .20
		$Timer.wait_time = base_wait_time * (1-percent_reduction)
		$Timer.start()
	
	elif  upgade.id == "sword_damage":
		additional_damage_percent = 1 + (current_upgrade["sword_damage"]["quantity"] * 0.5)
