class_name Flashlight
extends Node2D


@export var point_light: PointLight2D


func toggle() -> void:
	visible = not visible
