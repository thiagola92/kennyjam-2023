extends Node2D


@export var point_light: PointLight2D


func toggle() -> void:
	point_light.visible = not point_light.visible
