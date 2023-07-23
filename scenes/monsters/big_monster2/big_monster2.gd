extends CharacterBody2D


@export var base_movement_speed: float = 110

@export var follow_player: bool = false

@export var player: Player

var x = [-4514, 2169]
var y = [1760, -1143]

var current_random_position: Vector2

var switch_warn_audio: bool = false

var is_player_close: bool = false

var is_stunned: bool = false

var buff_speed: float = 0


func _process(delta: float) -> void:
	if player and player.visible:
		if is_player_close and player.spend_cross_charge():
			is_stunned = true
			$StunCooldown.start()
			$Exorcism.play()
		
		if is_stunned:
			$NavigationAgent2D.target_position = current_random_position
		else:
			$NavigationAgent2D.target_position = player.global_position
	else:
		if not current_random_position:
			_on_timer_timeout()
		$NavigationAgent2D.target_position = current_random_position
	
	if is_player_close and buff_speed < 50:
		buff_speed += 1 * delta


func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to($NavigationAgent2D.get_next_path_position())
	
	velocity = direction * (base_movement_speed + buff_speed)
	move_and_slide()


func _detect_player(body: Node2D) -> void:
	if body is Player:
		body._play_scream()
		body.set_physics_process(false)
		body.get_node("Transitioner")._transition()
		body.get_node("Transitioner").visible = true


func _play_cry () -> void:
	get_node("Cry").play()


func _on_timer_timeout() -> void:
	current_random_position = Vector2(randf_range(x[0], x[1]), randf_range(y[0], y[1]))


func _on_close_area_body_entered(body: Node2D) -> void:
	if body is Player:
		is_player_close = true
		body.target_heart_speed = 1.5
	
	if is_player_close and not $Warn1.playing and not $Warn2.playing:
		if switch_warn_audio:
			$Warn1.play()
		else:
			$Warn2.play()
		
		switch_warn_audio = not switch_warn_audio


func _on_close_area_body_exited(body: Node2D) -> void:
	if body is Player:
		is_player_close = false
		buff_speed = 0
		body.target_heart_speed = 1.0


func _on_stun_cooldown_timeout() -> void:
	is_stunned = false
