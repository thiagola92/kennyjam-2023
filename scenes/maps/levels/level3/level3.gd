extends Node2D


@export var player: Player


func _ready() -> void:
	player.is_flashlight_enabled = true
	player.is_cross_enabled = true
	
	if ControlBox.first_hide:
		ControlBox._show_label("You can always hide from the monster by interacting with unlocked doors with E key", "e_key", 6)
