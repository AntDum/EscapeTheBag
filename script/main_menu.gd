extends Control

@onready var play_button: Button = %PlayButton
const LEVEL = preload("res://scenes/level.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL)
