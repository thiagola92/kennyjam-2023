extends Sprite2D


var player: Player

func _process(delta: float) -> void:
	if player and Input.is_action_just_pressed("interaction"):
		player.is_cross_enabled = true
		_remove_sparkles()
		queue_free()

func _remove_sparkles () -> void:
	ControlBox._show_label("You can now press SPACE to use your crucifix", "space_key", 1)
	get_parent().get_node("CanvasLayer/star_particle").visible = false
	get_parent().get_node("Timer").start()
	get_parent().get_node("BigMonster")._play_knock()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
