extends Node2D

@export var label_showing: bool = false

func _show_label (text: String) -> void:
	$Text.text = text
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property($Text, "visible_ratio", 1.0, 1)
	label_showing = true
	

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("interaction") and label_showing:
		$Text.visible_ratio = 0
		label_showing = false
