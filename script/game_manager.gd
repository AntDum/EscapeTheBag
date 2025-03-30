extends Node2D
class_name GameManager

func _on_area_2d_body_entered(body: Node2D) -> void:
	ObjectList.win()
