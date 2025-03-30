extends Node2D

@onready var spawn_point: PathFollow2D = %SpawnPoint
@onready var timer: Timer = $Timer
@onready var platforms: Node2D = $"../Platforms"
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var ob = preload("res://scenes/objects/sword.tscn")

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_object() -> void:
	var new_object : Node2D = ob.instantiate()
	new_object.global_position = get_random_spawn_point()
	platforms.add_child(new_object)

func get_random_spawn_point() -> Vector2:
	spawn_point.progress_ratio = rng.randf()
	return spawn_point.global_position

func _on_timer_timeout() -> void:
	spawn_object()
