extends CharacterBody2D

@export var arena_time_manager: Node
@export var speed = 90#玩家速度
var number_colliding_bodies = 0
@onready var damage_interval_timer: Timer = $DamageIntervalTimer
@onready var health_component: HealthComponent = $HealthComponent
@onready var health_bar: ProgressBar = $HealthBar
@onready var abilities: Node = $Abilities
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var visuals: Node2D = $Visuals


func _ready() -> void:
	arena_time_manager.arena_difficulty_increased.connect(on_arena_difficulty_increased)
	GameEvents.ability_upgrade_added.connect(on_ability_upgrade_added)
	updaye_health_display()
#获得键盘输入
func _process(delta: float) -> void:
	velocity = Input.get_vector("move_left","move_right","move_up","move_down")*speed
	move_and_slide()
	if velocity.x != 0 || velocity.y != 0:
		animation_player.play("walk")
	else:
		animation_player.play("RESET")
	
	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale = Vector2(move_sign,1)

func check_deal_damage():
	if number_colliding_bodies == 0 || !damage_interval_timer.is_stopped():
		return
	health_component.damage(1)
	damage_interval_timer.start()

func updaye_health_display():
	health_bar.value = health_component.get_health_percent()

func _on_collision_area_2d_body_entered(body: Node2D) -> void:
	number_colliding_bodies += 1
	check_deal_damage()

func _on_collision_area_2d_body_exited(body: Node2D) -> void:
	number_colliding_bodies -= 1


func _on_damage_interval_timer_timeout() -> void:
	check_deal_damage()


func _on_health_component_health_changed() -> void:
	updaye_health_display()



func on_ability_upgrade_added(ability_upgrade: AbilityUpgrade,current_upgrades:Dictionary):
	if ability_upgrade is Ability:
		var ability = ability_upgrade as Ability
		abilities.add_child(ability.ability_controller_scene.instantiate())
	elif ability_upgrade.id == "player_speed":
		speed = speed + (speed * current_upgrades["player_speed"]["quantity"] * 0.1)

func on_arena_difficulty_increased(difficulty: int):
	var health_regeneration_quantiy = MetaProgression.get_upgrade_count("health_regeneration")
	if health_regeneration_quantiy > 0:
		var is_thirty_second_interval = (difficulty % 6) == 0
		if is_thirty_second_interval:
			health_component.heal(health_regeneration_quantiy)


func _on_health_component_health_decreased() -> void:
	GameEvents.emit_player_damaged()
	$HitRandomStreamPlayer2DCompoent.play_random()
