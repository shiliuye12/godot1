extends Area2D

const SPEED : int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("left"):
	#	position.x -= SPEED *delta
	#if Input.is_action_pressed("right"):
	#	position.x += SPEED *delta
	
	var movement:float = Input.get_axis("left","right")
	position.x += SPEED * delta * movement
	
	position.x = clamp(
		position.x,
		Game.get_vpr().position.x,
		Game.get_vpr().end.x
	)


func _on_area_entered(_area: Area2D) -> void:
	pass
