extends Node2D


@export var label_showing: bool = false

@export var msg: Label

func _show_label (text: String) -> void:
	msg.text = text
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(msg, "visible_ratio", 1.0, 3)
	label_showing = true
	
func _hide_label () -> void:
	msg.visible_ratio = 0
	label_showing = false

