extends Node2D

var _first_msg_showed: bool = false
var _second_msg_showed: bool = false
var _third_msg_showed: bool = false
var _forth_msg_showed: bool = false
var _fifth_msg_showed: bool = false

func _process(delta: float) -> void:
	var UIBox = get_node("Player").get_node("UIBox")
	if not _first_msg_showed and not UIBox.label_showing:
		UIBox._show_label("Wait, where am I?")
		_first_msg_showed = true
	elif not _second_msg_showed and not UIBox.label_showing:
		UIBox._show_label("I don't recognize this place...")
		_second_msg_showed = true
	elif not _third_msg_showed and not UIBox.label_showing:
		UIBox._show_label("My phone also doesn't work, what a time to be lost.")
		_third_msg_showed = true
	elif not _forth_msg_showed and not UIBox.label_showing:
		UIBox._show_label("Maybe that street post over there can give me some answers about where I am")
		_forth_msg_showed = true
	elif not _fifth_msg_showed and not UIBox.label_showing:
		UIBox._show_label("That is... If I can get there without stumbling too much in my own feet. It is dark as hell...")
		_fifth_msg_showed = true
		
	if Input.is_action_just_pressed("interaction") and UIBox.label_showing:
		UIBox._hide_label()

