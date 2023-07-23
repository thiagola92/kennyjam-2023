extends MarginContainer


@export var scroll_container: ScrollContainer


func _process(delta: float) -> void:
	scroll_container.scroll_vertical += 1


func _unhandled_input(event: InputEvent) -> void:
	if (
		Input.is_action_just_pressed("cancel")
		or Input.is_action_just_pressed("cross")
		or Input.is_action_just_pressed("flashlight")
		or Input.is_action_just_pressed("interaction")
		or Input.is_action_just_pressed("down")
		or Input.is_action_just_pressed("up")
		or Input.is_action_just_pressed("right")
		or Input.is_action_just_pressed("left")
		or Input.is_action_just_pressed("run")
	):
		get_tree().change_scene_to_file("res://scenes/screen/main/main.tscn")
