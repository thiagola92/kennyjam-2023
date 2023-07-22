extends Node2D

@onready var player: Player = $Player

@onready var text_box: UIBox = $Player.ui_box

func _on_body_enter(body: Node2D) -> void:
	if body is Player:
		text_box._show_label("I'm not going back out there with that thing around...", 3)


func _on_body_leave(body: Node2D) -> void:
	if body is Player:
		text_box._hide_label()


func _on_timer_timeout() -> void:
	var monster = get_node("BigMonster")
	monster._show_monster()
	monster._stop_knock()
	monster._play_cry()
