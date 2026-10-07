extends Control

@onready var game_manager: Node = GameManager
@onready var music: Node = Music
@onready var player_1: OptionButton = %Player1
@onready var player_2: OptionButton = %Player2
@onready var player_1_controller: Label = %Player1Controller
@onready var player_2_controller: Label = %Player2Controller

func _ready() -> void:
	music.stop()
	player_1_controller.remove_theme_color_override("font_color")
	player_2_controller.remove_theme_color_override("font_color")


func _on_start_pressed() -> void:
	var selected_player_1 = "ai" if player_1.get_selected_id() else "human"
	var selected_player_2 = "ai" if player_2.get_selected_id() else "human"
	game_manager.starting(selected_player_1, selected_player_2)
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_player_1_item_selected(index: int) -> void:
	if(index == 0):
		player_1_controller.add_theme_color_override("font_color", Color(0.197, 0.197, 0.197, 1.0))
	else:
		player_1_controller.remove_theme_color_override("font_color")


func _on_player_2_item_selected(index: int) -> void:
	if(index == 0):
		player_2_controller.add_theme_color_override("font_color", Color(0.197, 0.197, 0.197, 1.0))
	else:
		player_2_controller.remove_theme_color_override("font_color")
