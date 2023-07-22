class_name GameUI
extends CanvasLayer


@export var flashlight: TextureRect

@export var cross: TextureRect


func change_to_flashlight() -> void:
	flashlight.visible = true
	cross.visible = false


func change_to_cross() -> void:
	cross.visible = true
	flashlight.visible = false

func change_to_empty() -> void:
	cross.visible = false
	flashlight.visible = false
