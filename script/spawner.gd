extends Path2D

@onready var timer: Timer = $Timer
@onready var spawn_point: PathFollow2D = $SpawnPoint

@export var target: Node2D = null
@export var higher_than_target := -700

@export var platforms: Node2D
@export var min_delay: float = 0.5
@export var max_delay: float = 1.5 

@export var scale_object := 1.5

var spawned = 0
@export var max_spawning := -1

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if target:
		global_position.y = min(target.global_position.y + higher_than_target, global_position.y)

func spawn_object() -> void:
	spawned += 1
	if max_spawning != -1 and spawned >= max_spawning:
		queue_free()
	var random_scene : PackedScene = ObjectList.get_random_item()
	if random_scene:
		var new_object : FallingObject = random_scene.instantiate()
		new_object.gravity_scale = 0.03
		new_object.global_position = get_random_spawn_point()
		new_object.internal_scale = 1.5
		platforms.add_child(new_object)
		new_object.linear_velocity = Vector2(0, 80)
		new_object.global_rotation_degrees = rng.randf() * 360
	else:
		push_error("No scene to load")

func get_random_spawn_point() -> Vector2:
	spawn_point.progress_ratio = rng.randf()
	return spawn_point.global_position

func _on_timer_timeout() -> void:
	spawn_object()
	timer.wait_time = rng.randf_range(min_delay, max_delay)
