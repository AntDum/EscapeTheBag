class_name FallingObject
extends RigidBody2D

var internal_scale := 2.0

func _ready() -> void:
	if $Sprite2D:
		$Sprite2D.scale = Vector2(internal_scale, internal_scale)
	if $CollisionPolygon2D:
		$CollisionPolygon2D.scale = Vector2(internal_scale, internal_scale)
	if $CollisionShape2D:
		$CollisionShape2D.scale = Vector2(internal_scale, internal_scale)
