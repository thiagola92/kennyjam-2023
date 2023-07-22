extends Node2D

var _first_msg_showed: bool = false
var _second_msg_showed: bool = false
var _third_msg_showed: bool = false
var _forth_msg_showed: bool = false
var _fifth_msg_showed: bool = false

func _process(delta: float) -> void:
	var player = get_node("Player")
	var text_box = player.get_node("UIBox")
	
	if not _first_msg_showed and not text_box.label_showing:
		text_box._show_label("Wait, where am I?", 2)
		set_physics(false, player)
		_first_msg_showed = true
	elif not _second_msg_showed and not text_box.label_showing:
		text_box._show_label("I don't recognize this place...", 3)
		set_physics(false, player)
		_second_msg_showed = true
	elif not _third_msg_showed and not text_box.label_showing:
		text_box._show_label("My phone also doesn't work, what a time to be lost.", 4)
		set_physics(false, player)
		_third_msg_showed = true
	elif not _forth_msg_showed and not text_box.label_showing:
		text_box._show_label("Maybe that street post over there can give me some answers about where the hell I ended up", 6)
		set_physics(false, player)
		_forth_msg_showed = true
	elif not _fifth_msg_showed and not text_box.label_showing:
		text_box._show_label("That is... If I can get there without stumbling too much in my own feet. It is dark as hell...", 7)
		set_physics(false, player)
		_fifth_msg_showed = true
		
	if Input.is_action_just_pressed("interaction") and text_box.label_showing:
		text_box._hide_label()
		set_physics(true, player)

func set_physics (flag: bool, player: Player) -> void:
	player.set_physics_process(flag)
