extends CharacterBody2D


@export var movement_speed: int = 100
@export var animation_player: AnimationPlayer

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	_change_direction(direction)
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
	
	velocity = direction * movement_speed
	
	move_and_slide()

func _change_direction(direction: Vector2) -> void:
	
	if direction == Vector2.DOWN:
		animation_player.play("WalkDown")
	if direction == Vector2.UP:
		animation_player.play("WalkUp")
	if direction == Vector2.LEFT:
		animation_player.play("WalkLeft")
	if direction == Vector2.RIGHT:
		animation_player.play("WalkRight")
	if direction == Vector2.ZERO:
		animation_player.stop()
	
	
