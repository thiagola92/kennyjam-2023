extends StaticBody2D


var player: Player


func _unhandled_input(event: InputEvent) -> void:
	if player and Input.is_action_just_pressed("interaction"):
		_remove_sparkles()
		player.is_flashlight_enabled = true
		queue_free()

func _remove_sparkles () -> void:
	ControlBox._show_label("You can now press F to use your flashlight", "f_key", 1)
	get_parent().get_node("CanvasLayer/star_particle3").visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
