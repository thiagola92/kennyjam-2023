class_name Player
extends CharacterBody2D

var last_direction: Vector2

var key_quantity: int = 0

var target_heart_speed = 1

@export var movement_speed: int = 100

@export var movement_debuff: float = 1.0

@export var animation_player: AnimationPlayer

@export var flashlight: Flashlight

@export var cross: Cross

@export var game_ui: GameUI

@export var is_flashlight_enabled: bool = false

@export var is_cross_enabled: bool = false

@onready var ui_box: UIBox = $UIBox

func _process(delta: float) -> void:
	$Heart.pitch_scale = lerpf($Heart.pitch_scale, target_heart_speed, 0.1)

func _physics_process(_delta: float) -> void:	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	var is_running: bool = Input.is_action_pressed("run")
	
	_change_walk_animation(direction, is_running)
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
		
	velocity = direction * movement_speed * movement_debuff
	
	if is_running:
		ControlBox._verify_first_run()
		velocity *= 1.5
	
	move_and_slide()


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("flashlight") and is_flashlight_enabled:
		if flashlight.toggle():
			ControlBox._verify_first_flashlight()
			game_ui.change_to_flashlight()
			cross.visible = false
		else:
			game_ui.change_to_empty()
			
	if Input.is_action_just_pressed("cross") and is_cross_enabled:
		if cross.toggle():
			ControlBox._verify_first_crucifix()
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
	
func _play_scream () -> void:
	$Scream.play()

func _add_key () -> void:
	key_quantity += 1
	
func _has_keys () -> bool:
	return key_quantity > 0

func start_heart() -> void:
	$Heart.play()


# Try to spend cross
func spend_cross_charge() -> bool:
	# Se a cruz estiver aparecendo e não estiver rodando, então pode usar a cruz
	if cross.visible and $CrossCooldown.is_stopped():
		$CrossCooldown.start()
		cross.disable()
		game_ui.change_to_empty()
		return true
	return false


func _on_cross_timer_timeout() -> void:
	cross.enable()
	$CrossAnimation.play("cross_returned")
	$CrossCooldown.stop()
