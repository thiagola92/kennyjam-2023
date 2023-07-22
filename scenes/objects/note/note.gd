extends StaticBody2D

var player: Player
var text_box: UIBox

var _message_idx: int = 0
var _messages: Array[Array] = [
	["It's been weeks since we end up in this hell hole", 3],
	["There are monsters everywhere, barely any food and, honestly, I think I'm starting to see things that don't exist", 7],
	["We can't stay here much longer, we need to get out to find some food, water and medice for John, he won't make for much longer with that wound", 7],
	["The cross helps to keep those things away, so we'll leave it at the wall to keep this place secure since our flashlights and suplements are stored here", 9],
	["Alice said that there is a big building in the other part of town, with lights inside, we hope to find someone who can help us", 7],
	["So we will barricade the window, hoping that nothing can get inside, and try to get to this building of sorts", 5],
	["And may God have mercy on us", 2],
]

var started_script: bool = false
var ended_script: bool = false

func _process(delta: float) -> void:
	if not started_script and player and Input.is_action_just_pressed("interaction") and not text_box.label_showing:
		_remove_sparkles()
	elif not ended_script and player and Input.is_action_just_pressed("interaction") and text_box.label_showing:
		_message_idx += 1
		show_text()
	elif started_script and ended_script and player and Input.is_action_just_pressed("interaction") and not text_box.label_showing:
		_message_idx = 0
		ended_script = false
		player.set_physics_process(false)
		show_text()

func _remove_sparkles () -> void:
	get_parent().get_node("CanvasLayer/star_particle2").visible = false
	started_script = true
	player.set_physics_process(false)
	show_text()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		text_box = player.ui_box

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
		text_box = null

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
