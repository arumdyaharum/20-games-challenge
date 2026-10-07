extends Node

const MAX_SCORE = 5

@onready var score_left: int = 0
@onready var score_right: int = 0
@onready var is_player_left_ai: bool = false
@onready var is_player_right_ai: bool = false

func add_score(is_right: bool):
	if (is_right):
		score_left += 1
	else:
		score_right += 1

func reset_score():
	score_right = 0
	score_left = 0
	is_player_left_ai = false
	is_player_right_ai = false

func starting(player_1: String, player_2: String):
	if (player_1 == "ai"):
		is_player_left_ai = true
	if (player_2 == "ai"):
		is_player_right_ai = true
	return

func stopping():
	reset_score()
