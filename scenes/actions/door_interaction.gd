extends "res://scenes/actions/interaction.gd"


var next_scene: PackedScene = preload("res://scenes/maps/levels/level2/level2.tscn")


func _execute_action () -> void:
	Checkpoint.last_checkpoint = next_scene
	get_tree().change_scene_to_packed(next_scene)
