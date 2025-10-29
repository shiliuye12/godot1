extends Node
class_name HealthComponent
#健康组件

signal died
signal health_changed
signal health_decreased

@export var max_health : float = 10#最大生命
var current_health: float#当前生命

func _ready() -> void:
	current_health = max_health

#受伤
func damage(damage_amount:float):
	current_health = clamp(current_health - damage_amount,0,max_health)
	health_changed.emit()
	if damage_amount > 0:
		health_decreased.emit()
	Callable(check_death).call_deferred()

func get_health_percent():
	if max_health <= 0:
		return
	return min(current_health / max_health,1)

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()

func heal(heal_amoint: int):
	damage(-heal_amoint)
