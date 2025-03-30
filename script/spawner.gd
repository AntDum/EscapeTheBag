extends Path2D

@onready var timer: Timer = $Timer
@onready var spawn_point: PathFollow2D = $SpawnPoint
@onready var platforms: Node2D = $"../Platforms"

@export var min_delay: float = 0.5
@export var max_delay: float = 2.0 

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_object() -> void:
	var new_object : RigidBody2D = load(ObjectList.get_random_item()).instantiate()
	new_object.global_position = get_random_spawn_point()
	new_object.angular_velocity = rng.randf_range(-1, 1)
	platforms.add_child(new_object)

func get_random_spawn_point() -> Vector2:
	spawn_point.progress_ratio = rng.randf()
	return spawn_point.global_position

func _on_timer_timeout() -> void:
	spawn_object()
	timer.wait_time = rng.randf_range(min_delay, max_delay)
