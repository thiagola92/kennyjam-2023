extends CharacterBody2D


@export var movement_speed: int = 170

@export var follow_player: bool = false

@export var player: Player

var x = [-4514, 2169]
var y = [1760, -1143]

var current_random_position: Vector2

func _process(delta: float) -> void:
	if player and player.visible:
		$NavigationAgent2D.target_position = player.global_position
	else:
		if not current_random_position:
			_on_timer_timeout()
		$NavigationAgent2D.target_position = current_random_position


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


func _on_timer_timeout() -> void:
	current_random_position = Vector2(randf_range(x[0], x[1]), randf_range(y[0], y[1]))
