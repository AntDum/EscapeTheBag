extends Node

const LEVEL = preload("res://scenes/level.tscn")
const WIN = preload("res://scenes/win.tscn")
const DEATH = preload("res://scenes/death.tscn")

var distance_left = 0
var time = 0
var best_time = 0

func play() -> void:
	get_tree().change_scene_to_packed(LEVEL)

func win() -> void:
	get_tree().change_scene_to_packed(WIN)

func lost() -> void:
	get_tree().change_scene_to_packed(DEATH)
	
func set_score(timer, distance) -> void:
	distance_left = distance
	time = timer
	if time > best_time:
		best_time = time
