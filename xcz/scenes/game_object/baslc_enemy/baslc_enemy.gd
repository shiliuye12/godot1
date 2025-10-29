extends CharacterBody2D

@onready var visuals: Node2D = $Visuals
@onready var velocity_component: Node = $VelocityComponent


#敌人的移动
func _process(delta: float) -> void:
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale = Vector2(-move_sign,1)


func _on_hurtbox_component_hit() -> void:
	$HitRandomAuidoPlayerCompoent.play_random()
