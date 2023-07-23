extends Node2D

var player: Player

func _unhandled_input(event: InputEvent) -> void:
	if player and Input.is_action_just_pressed("interaction"):
		_remove_sparkles()
		player._add_key()
		ControlBox._show_label("Key added to your inventory", "", 2)
		queue_free()

func _remove_sparkles () -> void:
	var sparkles = get_parent().get_node("CanvasLayer/star_particle")
	
	if sparkles:
		sparkles.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
