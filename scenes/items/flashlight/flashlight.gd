class_name Flashlight
extends PointLight2D


func toggle() -> bool:
	visible = not visible
	return visible
