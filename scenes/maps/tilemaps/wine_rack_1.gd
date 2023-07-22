extends Node2D

var pushing = false
var ponto_inicial: Vector2

func _input(event) -> void:
	if event is InputEventKey:

		if event.keycode == KEY_E:
			if event.pressed:
				pushing = true
				var player_node = get_node_or_null("../Player")
				#if player_node:
					#player_node.collision_layer = 2  
					#player_node.collision_mask = 2 
				ponto_inicial = global_position - player_node.global_position
			else:
				pushing = false

func _process(_delta: float) -> void:
	if pushing:
		var player_node = get_node_or_null("../Player")
		var nova_posicao = ponto_inicial + player_node.global_position
		global_position.x = nova_posicao.x
		#global_position.y = nova_posicao.y
