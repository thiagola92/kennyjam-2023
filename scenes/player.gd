extends CharacterBody2D


@export var movement_speed: int = 500


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# For people using joystick
	if direction.length() > 1:
		direction = direction.normalized()
	
	velocity = direction * movement_speed
	move_and_slide()
