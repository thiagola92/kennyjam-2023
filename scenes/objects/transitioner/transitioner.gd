extends Control

func _transition() -> void:
	$AnimationPlayer.play("Transition")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/screen/death/death.tscn")
