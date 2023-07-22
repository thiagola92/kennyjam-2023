extends Node2D

var _message_idx: int = 0
var _messages: Array[Array] = [
	["Wait, where am I?", 2],
	["I don't recognize this place...", 3],
	["My phone also doesn't work, what a time to be lost.", 4],
	["Maybe that street post over there can give me some answers about where the hell I ended up", 6],
	["That is... If I can get there without stumbling too much in my own feet. It is dark as hell...", 7],
]

var _camera_offset: bool = false
var _ended_script: bool = false

@onready var player: Player = $Player

@onready var text_box: UIBox = $Player.ui_box
@onready var control_box: ControlBox = $Player.control_box

func _ready() -> void:
	player.set_physics_process(false)
	show_text()


func _process(delta: float) -> void:
	if not _ended_script and Input.is_action_just_pressed("interaction") and text_box.label_showing:
		_message_idx += 1
		show_text()


func show_text() -> void:
	# No more texts
	if _message_idx >= _messages.size():
		text_box._hide_label()
		player.set_physics_process(true)
		_ended_script = true
		control_box._show_label("Use WASD to walk", "wasd_keys", 1)
		return

	if _message_idx > 2:
		_move_camera()
		
	var text_and_time: Array = _messages[_message_idx]
	var text: String = text_and_time[0]
	var time: float = text_and_time[1]
	
	text_box._show_label(text, time)
	
	
func _move_camera () -> void:
	var camera = player.get_node("Camera2D")
	var tween = create_tween().bind_node(self)
	
	if not _camera_offset:
		var vector: Vector2 = $CanvasLayer/star_particle.position
		vector.x = vector.x + 200
		vector.y = 0
		
		tween.tween_property(camera, "position", vector, 2)
		_camera_offset = true
		
	elif _camera_offset:
		tween.tween_property(camera, "position", Vector2.ZERO, 2)
