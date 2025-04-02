extends Control

@onready var time: Label = %Time

func _ready() -> void:
	time.text = str(roundf(SceneManager.time * 10.0) / 10.0) + " s"


func _on_button_pressed() -> void:
	SceneManager.play()
