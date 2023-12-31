extends Node2D

@export var follow_player: bool = false

func _process(delta: float) -> void:
	pass

func _show_monster() -> void:
	$MonsterSprite.visible = true
	$MonsterParticles.visible = true
	$MonsterAnimation.play("phasing")
	follow_player = true

func _detect_player(body: Node2D) -> void:
	if body is Player:
		body._play_scream()
		body.set_physics_process(false)
		body.get_node("Transitioner")._transition()
		body.get_node("Transitioner").visible = true

func _play_cry () -> void:
	get_node("Cry").play()
	
func _play_knock () -> void:
	get_node("Knock").play()

func _stop_knock () -> void:
	get_node("Knock").stop()
