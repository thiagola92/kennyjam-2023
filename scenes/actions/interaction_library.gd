extends "res://scenes/actions/interaction.gd"

var next_scene: PackedScene = preload("res://scenes/maps/levels/level4/level4.tscn")
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
	if player._has_keys():
		Checkpoint.last_checkpoint = next_scene
		get_tree().change_scene_to_packed(next_scene)
	else:
		$LockedDoorSound.play(0)
		ControlBox._show_label("You will need a key to enter this building", "", 2)
