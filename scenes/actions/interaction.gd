extends Node2D

var player_on_area: bool = false

func _detect_entry(body: Node2D) -> void:
	if body is Player:
		player_on_area = true
		print('entry')

func _detect_leave(body: Node2D) -> void:
	if body is Player:
		player_on_area = false
		print('leave')

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interaction") and player_on_area:
		_execute_action()

func _execute_action () -> void:
	pass

