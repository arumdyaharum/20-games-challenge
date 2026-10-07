extends Control

@onready var music: Node = Music
@onready var game_over_music: AudioStreamPlayer = $GameOverMusic

func _ready() -> void:
	music.stop()
	game_over_music.play()

func _on_back_to_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
