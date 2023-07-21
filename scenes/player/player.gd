extends CharacterBody2D


@export var movement_speed: int = 100
@export var animation_player: AnimationPlayer
@export var flashlight: Flashlight


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
	if Input.is_action_just_pressed("flashlight") and flashlight:
		flashlight.toggle()


func _change_walk_animation(direction: Vector2, is_running: bool) -> void:
	match direction:
		Vector2.DOWN:
			animation_player.play("WalkDown")
		Vector2.UP:
			animation_player.play("WalkUp")
		Vector2.LEFT:
			animation_player.play("WalkLeft")
		Vector2.RIGHT:
			animation_player.play("WalkRight")
		Vector2.ZERO:
			animation_player.stop()
			animation_player.seek(0.0, true)
	
	animation_player.speed_scale = 1.5 if is_running else 1.0
