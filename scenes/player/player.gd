class_name Player
extends CharacterBody2D


var last_direction: Vector2
var _first_walk: bool = true

@export var movement_speed: int = 100

@export var animation_player: AnimationPlayer

@export var flashlight: Flashlight

@export var game_ui: GameUI

@export var is_flashlight_enabled: bool = false

@export var is_cross_enabled: bool = false

@onready var ui_box: UIBox = $UIBox

@onready var control_box: ControlBox = $ControlBox

func _physics_process(_delta: float) -> void:	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	var is_running: bool = Input.is_action_pressed("run")
	
	_change_walk_animation(direction, is_running)
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
		
	velocity = direction * movement_speed
	
	if is_running:
		velocity *= 1.5
	
	move_and_slide()


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("flashlight") and is_flashlight_enabled:
		if flashlight.toggle():
			game_ui.change_item(game_ui.FLASHLIGHT)
		else:
			game_ui.remove_item()


func _change_walk_animation(direction: Vector2, is_running: bool) -> void:
	match direction:
		Vector2.DOWN:
			_verify_first_walk()
			animation_player.play("WalkDown")
			last_direction = direction
		Vector2.UP:
			_verify_first_walk()
			animation_player.play("WalkUp")
			last_direction = direction
		Vector2.LEFT:
			_verify_first_walk()
			animation_player.play("WalkLeft")
			last_direction = direction
		Vector2.RIGHT:
			_verify_first_walk()
			animation_player.play("WalkRight")
			last_direction = direction
		Vector2.ZERO:
			animation_player.stop()
			animation_player.seek(0.0, true)
	
	animation_player.speed_scale = 1.5 if is_running else 1.0

func _verify_first_walk () -> void:
	if _first_walk:
		control_box._hide_label()
		_first_walk = false
