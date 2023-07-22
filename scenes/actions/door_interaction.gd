extends "res://scenes/actions/interaction.gd"


func _execute_action () -> void:
	get_tree().change_scene_to_file("res://scenes/maps/levels/level2/level2.tscn")
