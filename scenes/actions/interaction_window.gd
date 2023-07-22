extends "res://scenes/actions/interaction.gd"

func _detect_entry(body: Node2D) -> void:
	if body is Player:
		player_on_area = true

func _detect_leave(body: Node2D) -> void:
	if body is Player:
		player_on_area = false

func _execute_action () -> void:
	get_tree().change_scene_to_file("res://scenes/maps/levels/level3/level3.tscn")
