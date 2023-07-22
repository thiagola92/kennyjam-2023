extends Node2D

@onready var player: Player = $Player

@onready var text_box: UIBox = $Player.ui_box

func _on_body_enter(body: Node2D) -> void:
	if body is Player:
		text_box._show_label("I'm not going back out there with that thing around...", 3)


func _on_body_leave(body: Node2D) -> void:
	if body is Player:
		text_box._hide_label()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction") and text_box.label_showing:
		ControlBox._verify_first_action()
		text_box._hide_label()
