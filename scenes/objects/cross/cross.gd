extends Sprite2D


var player: Player


func _process(delta: float) -> void:
	if player and Input.is_action_just_pressed("interaction"):
		player.is_cross_enabled = true
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
