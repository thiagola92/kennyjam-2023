extends CharacterBody2D


@export var movement_speed: int = 170

@export var follow_player: bool = false

@export var player: Player


func _process(delta: float) -> void:
	if player:
		$NavigationAgent2D.target_position = player.global_position


func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to($NavigationAgent2D.get_next_path_position())
	
	velocity = direction * movement_speed
	move_and_slide()


func _detect_player(body: Node2D) -> void:
	if body is Player:
		body._play_scream()
		body.set_physics_process(false)
		body.get_node("Transitioner")._transition()
		body.get_node("Transitioner").visible = true


func _play_cry () -> void:
	get_node("Cry").play()
