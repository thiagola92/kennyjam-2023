extends MarginContainer


func start_game():
	get_tree().change_scene_to_file("res://scenes/maps/levels/level1/level1.tscn")


func exit_game():
	get_tree().quit()
