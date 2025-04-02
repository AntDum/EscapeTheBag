extends CharacterBody2D

signal Dead

@onready var game_manager: GameManager = $"../GameManager"
@onready var death_ray: RayCast2D = $RayCast2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

@onready var sound_jump: AudioStreamPlayer = $Sounds/Jump
@onready var sound_dead: AudioStreamPlayer = $Sounds/Dead
@onready var sound_land: AudioStreamPlayer = $Sounds/Land

const GRAVITY_SCALE := 1.3
const SPEED := 500.0 * 60
const JUMP_VELOCITY := -1300.0 * 60

const DEATH = preload("res://scenes/death.tscn")

var was_on_floor = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * GRAVITY_SCALE * delta
		if not $Sprite2D.is_playing(): 
			$Sprite2D.play("fall")
	else:
		if not was_on_floor:
			sound_land.play()
			cpu_particles_2d.emitting = true
		if death_ray.is_colliding():
			var collider = death_ray.get_collider()
			sound_dead.play()
			call_deferred("emit_signal", "Dead")
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * delta
		if is_on_floor() : $Sprite2D.play("run")
		$Sprite2D.flip_h = direction <= 0
	else:
		if is_on_floor() : $Sprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * delta
		sound_jump.play()
		$Sprite2D.play("jump")

	was_on_floor = is_on_floor()
	move_and_slide()
