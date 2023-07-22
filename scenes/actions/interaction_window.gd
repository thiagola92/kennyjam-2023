extends "res://scenes/actions/interaction.gd"


var next_scene: PackedScene = preload("res://scenes/maps/levels/level3/level3.tscn")


func _detect_entry(body: Node2D) -> void:
	if body is Player:
		player_on_area = true

func _detect_leave(body: Node2D) -> void:
	if body is Player:
		player_on_area = false

func _execute_action () -> void:
	Checkpoint.last_checkpoint = next_scene
	get_tree().change_scene_to_packed(next_scene)
