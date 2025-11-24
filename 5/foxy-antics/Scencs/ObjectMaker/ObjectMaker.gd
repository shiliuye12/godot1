extends Node2D

const OBJECT_SCENES: Dictionary[Constants.ObjectType, PackedScene] = {
	Constants.ObjectType.BULLET_PLAYER: preload("uid://cdnuiyrvke4nw"),
	Constants.ObjectType.BULLET_ENEMY: preload("uid://dv2es2pg8760l")
}

func _enter_tree() -> void:
	SignalHub.on_create_bullet.connect(on_create_bullet)

func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, ob_type: Constants.ObjectType):
	if OBJECT_SCENES.has(ob_type) == false:
		return
	var nb: Bullet = OBJECT_SCENES[ob_type].instantiate()
	nb.setup(pos, dir, speed)
	call_deferred("add_child", nb)
