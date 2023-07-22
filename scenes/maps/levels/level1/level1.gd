extends "res://scenes/monsters/behaviour.gd"

const FOLLOW_SPEED = 120

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if follow_player:
		var player = get_parent().get_node("Player")
		var monster = get_parent().get_node("BigMonster")
		var target_position = (player.position - monster.position).normalized()
		
		monster.velocity = target_position * FOLLOW_SPEED
		monster.move_and_slide()
