class_name ControlBox
extends Node2D

var tween: Tween
var once: bool = true

@export var label_showing: bool = false
@export var msg: Label


func _show_label (text: String, icon: String, time: float) -> void:
	if tween:
		tween.kill()
	
	msg.visible_ratio = 0
	msg.text = text
	tween = create_tween().bind_node(self)
	tween.tween_property(msg, "visible_ratio", 1.0, time)

	var texture = $CanvasLayer/VBoxContainer/HBoxContainer/TextureRect
	texture.visible = true
	texture.texture = load("res://assets/ui/" + icon + ".png")

	label_showing = true
	
func _hide_label () -> void:
	if tween:
		tween.kill()
	
	msg.visible_ratio = 0
	label_showing = false
	$CanvasLayer/VBoxContainer/HBoxContainer/TextureRect.visible = false

