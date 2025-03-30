extends Node

const LEVEL = preload("res://scenes/level.tscn")
const WIN = preload("res://scenes/win.tscn")
const DEATH = preload("res://scenes/death.tscn")

func play() -> void:
	get_tree().change_scene_to_packed(LEVEL)

func win() -> void:
	get_tree().change_scene_to_packed(WIN)

func lost() -> void:
	get_tree().change_scene_to_packed(DEATH)
	


var scenes := []

func _ready() -> void:
	load_scenes_from_directory("res://scenes/objects/")

func load_scenes_from_directory(directory_path: String) -> bool:
	var dir = DirAccess.open(directory_path)
	
	if !dir:
		push_error("Impossible d'accéder au répertoire : " + directory_path)
		return false
		
	dir.list_dir_begin()
	
	var file_name := dir.get_next()
	while file_name != "":
		if !dir.current_is_dir():
			if file_name.ends_with(".tscn"):
				scenes.append(directory_path + file_name)
		
		file_name = dir.get_next()
	
	dir.list_dir_end()
	print(scenes)
	return true

func get_random_item() -> String:
	if scenes.is_empty():
		push_error("Aucune scène trouvée dans le répertoire")
		return ""
	
	randomize()  # Initialise le générateur aléatoire
	return scenes[randi() % scenes.size()]
