extends Node2D

var _first_msg_showed: bool = false
var _second_msg_showed: bool = false
var _third_msg_showed: bool = false
var _forth_msg_showed: bool = false
var _fifth_msg_showed: bool = false

var _message_idx: int = 0
var _messages: Array[Array] = [
	["Wait, where am I?", 2],
	["I don't recognize this place...", 3],
	["My phone also doesn't work, what a time to be lost.", 4],
	["Maybe that street post over there can give me some answers about where the hell I ended up", 6],
	["That is... If I can get there without stumbling too much in my own feet. It is dark as hell...", 7],
]

@onready var player: Player = $Player

@onready var text_box: UIBox = $Player.ui_box


func _ready() -> void:
	player.set_physics_process(false)
	show_text()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction") and text_box.label_showing:
		_message_idx += 1
		show_text()


func show_text() -> void:
	# No more texts
	if _message_idx >= _messages.size():
		text_box._hide_label()
		player.set_physics_process(true)
		return
	
	var text_and_time: Array = _messages[_message_idx]
	var text: String = text_and_time[0]
	var time: float = text_and_time[1]
	
	text_box._show_label(text, time)
