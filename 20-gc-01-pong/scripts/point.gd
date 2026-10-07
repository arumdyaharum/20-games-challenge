extends Area2D

@export var on_right = false 

@onready var timer: Timer = $Timer
@onready var game_manager: Node = GameManager
@onready var goal: AudioStreamPlayer = $Goal

func _on_body_entered(_body: Node2D) -> void:
	goal.play()
	if on_right:
		game_manager.add_score(true)
	else:
		game_manager.add_score(false)
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
