extends "res://scenes/actions/interaction.gd"


var next_scene: PackedScene = preload("res://scenes/maps/levels/level3/level3.tscn")

var player: Player

func _detect_entry(body: Node2D) -> void:
	if body is Player:
		player_on_area = true
		player = body

func _detect_leave(body: Node2D) -> void:
	if body is Player:
		player_on_area = false
		player = null

func _execute_action () -> void:
	if player.is_flashlight_enabled and player.is_cross_enabled:
		Checkpoint.last_checkpoint = next_scene
		get_tree().change_scene_to_packed(next_scene)
	else:
		ControlBox._show_label("There are still things to do in this area", "", 2)
