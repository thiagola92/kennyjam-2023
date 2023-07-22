extends "res://scenes/actions/interaction.gd"

var _message_idx: int = 0
var _messages: Array[Array] = [
	["What?", 1],
	["I can't read anything, what is this language?", 3],
	["I can't be that faraway from home to be in someplace with other alphabet", 4],
	["What was that sound?", 2]
]

var player: Player
var text_box: UIBox
var monster

var _start_dialog: bool = false
var _ended_script: bool = false

func _process(delta: float) -> void:
	if _start_dialog and Input.is_action_just_pressed("interaction") and text_box.label_showing:
		_message_idx += 1
		show_text()

func _detect_entry(body: Node2D) -> void:
	if not _ended_script:
		if body is Player:
			player_on_area = true
			_execute_action()

func _execute_action () -> void:
	_start_dialog = true
	var parent_node = get_parent().get_parent()
	
	player = parent_node.get_node("Player")
	monster = parent_node.get_node("BigMonster")
	text_box = player.get_node("UIBox")
	
	player.set_physics_process(false)
	show_text()

func show_text() -> void:
	if _message_idx >= _messages.size():
		text_box._hide_label()
		player.set_physics_process(true)
		monster._show_monster()
		return

	if _message_idx == 3:
		monster._play_cry()
		
	var text_and_time: Array = _messages[_message_idx]
	var text: String = text_and_time[0]
	var time: float = text_and_time[1]
	
	text_box._show_label(text, time)
	
	
func _unhandled_input(_event: InputEvent) -> void:
	pass
