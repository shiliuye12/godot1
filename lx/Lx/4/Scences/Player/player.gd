extends CharacterBody2D

class_name Player

@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var left: Sprite2D = $left
@onready var up: Sprite2D = $up
@onready var right: Sprite2D = $right
@onready var down: Sprite2D = $down

var can_move: bool = true
var fx: int = 1
var wz: Array[Vector2]
var score: int = 0
var can_left: bool = true
var can_up: bool = true
var can_right: bool = false
var can_down: bool = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left") and can_left:
		fx = 1
	elif event.is_action_pressed("up") and can_up:
		fx = 2
	elif event.is_action_pressed("right") and can_right:
		fx = 3
	elif event.is_action_pressed("down") and can_down:
		fx = 4

func _ready() -> void:
	SnakeSignalHub.on_score.connect(_on_score)
	left.show()
	up.hide()
	right.hide()
	down.hide()
	wz.resize(wz.size() + 200)
	wz[0] = self.position
	wz[1] = Vector2(self.position.x +80, self.position.y)
	wz[2] = Vector2(self.position.x +160, self.position.y)

func _on_timer_timeout() -> void:
	var new_position = global_position
	if fx == 1:
		can_left = true
		can_up = true
		can_right = false
		can_down = true
		left.show()
		up.hide()
		right.hide()
		down.hide()
		new_position.x -= 40
	elif fx == 2:
		can_left = true
		can_up = true
		can_right = true
		can_down = false
		left.hide()
		up.show()
		right.hide()
		down.hide()
		new_position.y -= 40
	elif fx == 3:
		can_left = false
		can_up = true
		can_right = true
		can_down = true
		left.hide()
		up.hide()
		right.show()
		down.hide()
		new_position.x += 40
	elif fx == 4:
		can_left = true
		can_up = false
		can_right = true
		can_down = true
		left.hide()
		up.hide()
		right.hide()
		down.show()
		new_position.y += 40
	if new_position.x < 0:
		new_position.x = 1112
	if new_position.x > 1152:
		new_position.x = 40
	if new_position.y < 0:
		new_position.y = 608
	if new_position.y > 648:
		new_position.y = 40
	position = new_position
	jlwz()

func jlwz():
	for i in range(wz.size() - 1, 0, -1):
		wz[i] = wz[i - 1]
	wz[0] = position

func _on_score():
	score += 1
