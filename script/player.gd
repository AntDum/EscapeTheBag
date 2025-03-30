extends CharacterBody2D

@onready var death_ray: RayCast2D = $RayCast2D

const AIR_SPEED = 400.0
const SPEED = 500.0
const JUMP_VELOCITY = -600.0

const DEATH = preload("res://scenes/death.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if not $Sprite2D.is_playing(): 
			$Sprite2D.play("fall")
	else:
		if death_ray.is_colliding():
			var collider = death_ray.get_collider()
			get_tree().change_scene_to_packed(DEATH)
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() : $Sprite2D.play("run")
		$Sprite2D.flip_h = direction-1
	else:
		if is_on_floor() : $Sprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite2D.play("jump")

	move_and_slide()
