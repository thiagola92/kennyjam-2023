extends "res://scenes/objects/note/note.gd"


func _ready() -> void:
	_messages = [
		["\"If you're reading this message, I'm so sorry for you.", 4],
		["That thing outside is really strong and will consume you if you let them", 3],
		["Do not believe in the illusions that it creates around you, your insanity will make it stronger", 9],
		["You will need to find a way to reach the bridge near the edge of the city", 7],
		["Crossing it you will be able to find a building that has a type of backdoor back to reality", 9],
		["I can't guarantee it still works, I, myself, will leave this place and try my luck, since I've been alone for so much time", 7],
		["Good luck to you, you will need it, and maybe we will meet someday back in reality\""],
	]
	
func _process(delta: float) -> void:
	var unlocked = player._has_keys()
	
	if unlocked and not started_script and player and Input.is_action_just_pressed("interaction") and not text_box.label_showing:
		_remove_sparkles()
	elif unlocked and not ended_script and player and Input.is_action_just_pressed("interaction") and text_box.label_showing:
		_message_idx += 1
		show_text()
	elif unlocked and started_script and ended_script and player and Input.is_action_just_pressed("interaction") and not text_box.label_showing:
		_message_idx = 0
		ended_script = false
		player.set_physics_process(false)
		show_text()
	else:
		ControlBox._show_label("You need a key to open this", "", 2)


func _remove_sparkles () -> void:
	get_parent().get_node("CanvasLayer/star_particle4").visible = false
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
