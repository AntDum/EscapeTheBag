extends Control

@onready var click_sound: AudioStreamPlayer = $ClickSound


func _on_play_button_pressed() -> void:
	click_sound.play()
	SceneManager.play()
