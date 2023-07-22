extends Node

@export var percent_hideout: float = 0.60
var is_hideout: bool = false

var player: Player
var label: Label

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var random_number = rng.randf_range(0, 1)
	is_hideout = random_number <= percent_hideout


func _detect_entry(body: Node2D) -> void:
	if body is Player:
		player = body


func _detect_leave(body: Node2D) -> void:
	if body is Player:
		player = null


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interaction") and player and player.visible:
		_execute_action()
	elif Input.is_action_just_pressed("interaction") and player and not player.visible:
		_unhide()


func _execute_action () -> void:
	if not is_hideout:
		_show_label_with_text('Locked')
		$LockedDoorSound.play(0)
	else:
		player.visible = false
		player.set_physics_process(false)


func _unhide() -> void:
	player.visible = true
	player.set_physics_process(true)


func _show_label_with_text (text: String) -> void:
	label.text = text
	$AnimationPlayer.play("up_label_animation")
