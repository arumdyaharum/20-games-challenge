extends CharacterBody2D

const SPEED = 400.0

enum Axis_Up {W, UP}
enum Axis_Down {S, DOWN}

@export var computer_target : RigidBody2D = null
@export var vertical_flip = false
@export var key_up : Axis_Up
@export var key_down : Axis_Down

var axis_up = "ui_up"
var axis_down = "ui_down"
var push_force = 80.0

func _ready() -> void:
	match key_up:
		Axis_Up.W:
			axis_up = "key_up"
		Axis_Up.UP:
			axis_up = "ui_up"
		_:
			print("Invalid up input");
	match key_down:
		Axis_Down.S:
			axis_down = "key_down"
		Axis_Down.DOWN:
			axis_down = "ui_down"
		_:
			print("Invalid down input");

func _physics_process(_delta: float) -> void:
	var screen_height = get_viewport_rect().size.y
	var half_paddle_height = $Paddle.size.y / 2
	
	if vertical_flip:
		$Paddle.rotation_degrees = -90
		$CollisionShape2D.rotation_degrees = -90

	if (computer_target):
		var direction = (computer_target.position - position).normalized()
		if direction:
			velocity.y = direction.y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	
	else:
		var direction := Input.get_axis(axis_up, axis_down)
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
		position.y = clamp(position.y, half_paddle_height, screen_height - half_paddle_height)

	move_and_slide()
