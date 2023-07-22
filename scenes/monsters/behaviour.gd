extends Node2D

@export var follow_player: bool = false

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	$MonsterSprite.visible = true
	$MonsterParticles.visible = true
	$MonsterAnimation.play("phasing")
	follow_player = true
