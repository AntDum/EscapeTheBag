extends Node2D
class_name GameManager


@onready var time_to_escape: Label = %TimeToEscape
@onready var distance_to_escape: Label = %DistanceToEscape
@onready var victory_area: Area2D = $"../Area2D"
@onready var player: CharacterBody2D = $"../Player"

@onready var win_sound: AudioStreamPlayer = $WinSound

var timer : float = 0.0
var distance : float = 0.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	win_sound.play()
	SceneManager.set_score(timer, distance)
	SceneManager.win()
	
func _on_player_dead() -> void:
	SceneManager.set_score(timer, distance)
	SceneManager.lost()

func _process(delta: float) -> void:
	distance = player.global_position.y - victory_area.global_position.y
	timer += delta
	distance_to_escape.text = str(roundi(distance)) + " m"
	time_to_escape.text = str(roundf(timer * 10.0) / 10.0) + " s"
