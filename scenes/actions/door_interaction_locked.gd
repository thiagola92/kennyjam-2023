extends "res://scenes/actions/interaction.gd"


func _execute_action () -> void:
	_show_label_with_text('Locked')
	$LockedDoorSound.play(0)

