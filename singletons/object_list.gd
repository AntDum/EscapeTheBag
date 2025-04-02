extends Node


const ACORN_1 = preload("res://scenes/objects/acorn_1.tscn")
const ACORN_3 = preload("res://scenes/objects/acorn_3.tscn")
const ASPARAGUS = preload("res://scenes/objects/asparagus.tscn")
const BAG_3 = preload("res://scenes/objects/bag_3.tscn")
const BANANA = preload("res://scenes/objects/banana.tscn")
const BONE = preload("res://scenes/objects/bone.tscn")
const BOTTLE_1 = preload("res://scenes/objects/bottle_1.tscn")
const CUP = preload("res://scenes/objects/cup.tscn")
const GEM_1 = preload("res://scenes/objects/gem_1.tscn")
const GEM_2 = preload("res://scenes/objects/gem_2.tscn")
const GEM_3 = preload("res://scenes/objects/gem_3.tscn")
const GEM_4 = preload("res://scenes/objects/gem_4.tscn")
const GEM_5 = preload("res://scenes/objects/gem_5.tscn")
const GEM_7 = preload("res://scenes/objects/gem_7.tscn")
const GOBELET_2 = preload("res://scenes/objects/gobelet_2.tscn")
const KEY = preload("res://scenes/objects/key.tscn")
const MEAT_1 = preload("res://scenes/objects/meat_1.tscn")
const MEAT_2 = preload("res://scenes/objects/meat_2.tscn")
const MEAT_3 = preload("res://scenes/objects/meat_3.tscn")
const MEAT_4 = preload("res://scenes/objects/meat_4.tscn")
const MUG = preload("res://scenes/objects/mug.tscn")
const SKULL_1 = preload("res://scenes/objects/skull_1.tscn")
const STARFRUIT = preload("res://scenes/objects/starfruit.tscn")
const SWORD = preload("res://scenes/objects/sword.tscn")


var scenes := [
	ACORN_1,
	ACORN_3,
	ASPARAGUS,
	BAG_3,
	BANANA,
	BONE,
	BOTTLE_1,
	CUP,
	GEM_1,
	GEM_2,
	GEM_3,
	GEM_4,
	GEM_5,
	GEM_7,
	GOBELET_2,
	KEY,
	MEAT_1,
	MEAT_2,
	MEAT_3,
	MEAT_4,
	MUG,
	SKULL_1,
	STARFRUIT,
	SWORD,
]

func get_random_item() -> PackedScene:
	if scenes.is_empty():
		push_error("Aucune scène trouvée dans le répertoire")
	
	randomize() # Initialise le générateur aléatoire
	return scenes[randi() % scenes.size()]
