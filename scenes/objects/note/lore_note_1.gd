extends "res://scenes/objects/note/note.gd"

func _ready() -> void:
	_messages = [
		["It's the same caligraphy from the other note, it says:", 4],
		["\"Sometimes I need to write, otherwise I'm sure I'll forget", 3],
		["Alice conviced us to come here, she said it should have food, or water, since there were dim lights inside, as if somebody were waling around", 9],
		["In the end we were pursued by that... Thing... And we can't come back to our original place", 7],
		["The things we left behind... The things we stashed... All our memories, it all stayed there. And there is nothing we can do about it", 9],
		["That thing its too fast, almost outran us to this library, and we lost Camille in one of those horribles alleys poorly iluminated", 7],
		["I miss the time when our worries were only about how many cities we could travel with our short salaries\"", 5],
		["...", 1],
	]

func _remove_sparkles () -> void:
	get_parent().get_node("CanvasLayer/star_particle1").visible = false
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
