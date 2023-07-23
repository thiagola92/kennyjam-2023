extends "res://scenes/objects/note/note.gd"

func _ready() -> void:
	_messages = [
		["\"I think last time I wrote something we still had some water, some food", 4],
		["Now that just ain't true anymore. We started seeing things in the walls, forcing us to lock the exit and barricade the windows", 3],
		["and the hunger is an eternal companion, we started eating the mice and drinking from the cracks in the ceiling everytime it rains", 9],
		["But we did find out more about this dimension, how the cientists create something that resambles a linear space that streches to infinity", 7],
		["Someting apart from time and space, to work as if it was, indeed, a jail", 9],
		["And since the thing outside cannot be killed, they hoped to, at least, contain it\"", 7],
		["...", 2],
	]

func _remove_sparkles () -> void:
	get_parent().get_node("CanvasLayer/star_particle3").visible = false
	started_script = true
	player.set_physics_process(false)
	show_text()

func show_text() -> void:
	# No more texts
	if _message_idx >= _messages.size():
		text_box._hide_label()
		player.set_physics_process(true)
		ended_script = true
		return
		
	var text_and_time: Array = _messages[_message_idx]
	var text: String = text_and_time[0]
	var time: float = text_and_time[1]
	
	text_box._show_label(text, time)
