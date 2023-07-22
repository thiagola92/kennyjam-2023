extends RigidBody2D


var player_close: bool

var player: Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not player_close:
		return
	
	set_collision_layer_value(1, true)
	
	if Input.is_action_pressed("interaction"):
		var direction_to_player = global_position.direction_to(player.global_position)
		var angle_from_looking = player.last_direction.angle_to(direction_to_player)
		var angle_deg = abs(rad_to_deg(angle_from_looking))
		
		if angle_deg < 45:
			linear_velocity = player.velocity * 1.1 # Pull
		else:
			set_collision_layer_value(1, false) # Push
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_close = true
		player = body
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player_close = false
		player = null
