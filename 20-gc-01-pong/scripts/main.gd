extends Node2D

@onready var game_manager: Node = GameManager
@onready var music: Node = Music

@onready var score_board: Label = $UI/ScoreBoard
@onready var circle: RigidBody2D = $Circle
@onready var paddle_left: CharacterBody2D = $PaddleLeft
@onready var paddle_right: CharacterBody2D = $PaddleRight
@onready var back_to_menu_button: Button = $UI/BackToMenuButton
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if (!music.playing):
		music.play()
	if game_manager.is_player_left_ai:
		paddle_left.modulate = Color(1.0, 0.312, 0.247, 1.0)
		find_child("PaddleLeft").set("computer_target", circle)
	if game_manager.is_player_right_ai:
		paddle_right.modulate = Color(1.0, 0.312, 0.247, 1.0)
		find_child("PaddleRight").set("computer_target", circle)
	score_board.text = str(game_manager.score_left, "      ", game_manager.score_right)

func _process(_delta: float) -> void:
	score_board.text = str(game_manager.score_left, "      ", game_manager.score_right)
	if (game_manager.score_left == game_manager.MAX_SCORE or game_manager.score_right == game_manager.MAX_SCORE):
		game_manager.stopping()
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_back_to_menu_button_pressed() -> void:
	game_manager.stopping()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_timer_timeout() -> void:
	back_to_menu_button.text = "Restart"
	back_to_menu_button.add_theme_color_override("font_color", Color(0.49, 0.49, 0.49, 1.0))

func _on_circle_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		timer.start()
		if (body.name == "PaddleLeft"):
			animation_player.play("paddle_left_impact")
		if (body.name == "PaddleRight"):
			animation_player.play("paddle_right_impact")
