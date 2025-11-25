extends Node2D

const OBJECT_SCENES: Dictionary[Constants.ObjectType, PackedScene] = {
	Constants.ObjectType.BULLET_PLAYER: preload("uid://cdnuiyrvke4nw"),
	Constants.ObjectType.BULLET_ENEMY: preload("uid://dv2es2pg8760l"),
	Constants.ObjectType.EXPLOSION: preload("uid://bvp2ui5gb2gbv"),
	Constants.ObjectType.PICKUP: preload("uid://d0atdp0l11cwk")
}

func _enter_tree() -> void:
	SignalHub.on_create_bullet.connect(on_create_bullet)
	SignalHub.on_create_object.connect(on_create_object)

func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, ob_type: Constants.ObjectType):
	if OBJECT_SCENES.has(ob_type) == false:
		return
	var nb: Bullet = OBJECT_SCENES[ob_type].instantiate()
	nb.setup(pos, dir, speed)
	call_deferred("add_child", nb)

func on_create_object(pos: Vector2, ob_type: Constants.ObjectType):
	var ex = OBJECT_SCENES[ob_type].instantiate()
	ex.global_position = pos
	call_deferred("add_child", ex)
