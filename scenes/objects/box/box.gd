extends StaticBody2D


var player: Player


func _unhandled_input(event: InputEvent) -> void:
	if player and Input.is_action_just_pressed("interaction"):
		player.is_flashlight_enabled = true
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
