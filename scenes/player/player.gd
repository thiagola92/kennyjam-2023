class_name Player
extends CharacterBody2D

var last_direction: Vector2

@export var movement_speed: int = 100

@export var animation_player: AnimationPlayer

@export var flashlight: Flashlight

@export var cross: Cross

@export var game_ui: GameUI

@export var is_flashlight_enabled: bool = false

@export var is_cross_enabled: bool = false

@onready var ui_box: UIBox = $UIBox

func _physics_process(_delta: float) -> void:	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	var is_running: bool = Input.is_action_pressed("run")
	
	_change_walk_animation(direction, is_running)
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
		
	velocity = direction * movement_speed
	
	if is_running:
		ControlBox._verify_first_run()
		velocity *= 1.5
	
	move_and_slide()


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("flashlight") and is_flashlight_enabled:
		if flashlight.toggle():
			game_ui.change_to_flashlight()
			cross.visible = false
		else:
			game_ui.change_to_empty()
			
	if Input.is_action_just_pressed("cross") and is_cross_enabled:
		if cross.toggle():
			game_ui.change_to_cross()
			flashlight.visible = false
		else:
			game_ui.change_to_empty()


func _change_walk_animation(direction: Vector2, is_running: bool) -> void:
	match direction:
		Vector2.DOWN:
			ControlBox._verify_first_walk()
			animation_player.play("WalkDown")
			last_direction = direction
		Vector2.UP:
			ControlBox._verify_first_walk()
			animation_player.play("WalkUp")
			last_direction = direction
		Vector2.LEFT:
			ControlBox._verify_first_walk()
			animation_player.play("WalkLeft")
			last_direction = direction
		Vector2.RIGHT:
			ControlBox._verify_first_walk()
			animation_player.play("WalkRight")
			last_direction = direction
		Vector2.ZERO:
			animation_player.stop()
			animation_player.seek(0.0, true)
	
	animation_player.speed_scale = 1.5 if is_running else 1.0
