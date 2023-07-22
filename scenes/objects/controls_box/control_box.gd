extends Node2D

var tween: Tween
var once: bool = true

@export var label_showing: bool = false
@export var msg: Label

var first_walk: bool = true
var first_run: bool = true
var first_flashlight: bool = true
var first_crucifix: bool = true
var first_action: bool = true

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

func _verify_first_walk () -> void:
	if first_walk:
		first_walk = false
		_hide_label()
		_show_label("You can also run using SHIFT", "shift_key", 1)
		
func _verify_first_run() -> void:
	if first_run:
		first_run = false
		_hide_label()

func _verify_first_action() -> void:
	if first_action:
		first_action = false
		_hide_label()
		
func _verify_first_flashlight() -> void:
	if first_flashlight:
		first_flashlight = false
		_hide_label()

func _verify_first_crucifix() -> void:
	if first_crucifix:
		first_crucifix = false
		_hide_label()
