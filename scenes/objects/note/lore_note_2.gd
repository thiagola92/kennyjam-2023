extends "res://scenes/objects/note/note.gd"


func _ready() -> void:
	_messages = [
		["\"It's been a while since we were trapped here with spiders and mice", 4],
		["But in the meanwhile we figured somethings out, since the only thing left to do, apart from crying, was reading", 3],
		["Apperently this is not the reality as we know (as expected), but actually a place like a cell for something much darker", 9],
		["The thing outsite, the one who travels in the eternal dark of this place, is an old entity", 7],
		["Something that the cientists awoke when studying about entities and were scared enough to create this place afterwards", 9],
		["This thing lives of everyone else's sanity, it consumes you, your fear and your soul. It creates other things like itself and is feeding of anyone that is unlucky enough to end up here", 7],
		["If, for some reason, you start seeing things... Be careful, that thing is near you\"", 5],
		["...", 2],
	]

func _remove_sparkles () -> void:
	get_parent().get_node("CanvasLayer/star_particle2").visible = false
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
