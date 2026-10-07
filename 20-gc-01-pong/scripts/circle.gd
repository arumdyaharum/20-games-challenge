extends RigidBody2D

const INITIAL_SPEED:int = 400

var current_speed = INITIAL_SPEED
var started = false

@onready var ball_impact: AudioStreamPlayer = $BallImpact
@onready var CENTER_SCREEN:Vector2 = get_viewport_rect().size / 2
@onready var x = randi_range(50, int(get_viewport_rect().size.x)) * (1 if randf() < 0.5 else -1)
@onready var y = randi_range(100, int(get_viewport_rect().size.y)) * (1 if randf() < 0.5 else -1)

func _ready() -> void:
	apply_central_impulse(Vector2(x, y).normalized() * INITIAL_SPEED)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.linear_velocity = state.linear_velocity.normalized() * current_speed

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		ball_impact.play()
		current_speed += 25
