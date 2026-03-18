extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func spawn(res: ItemResource):
	sprite_2d.texture = res.icon

func die():
	animation_player.play("die")
