extends Node2D

@export var player: Player


func _ready() -> void:
	player.is_flashlight_enabled = true
	player.is_cross_enabled = true
