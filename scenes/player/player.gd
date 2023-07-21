extends CharacterBody2D


@export var movement_speed: int = 100
@export var animation_player: AnimationPlayer
@export var flashlight: Flashlight


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	_change_direction(direction)
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
	
	velocity = direction * movement_speed
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("flashlight") and flashlight:
		flashlight.toggle()


func _change_direction(direction: Vector2) -> void:
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
