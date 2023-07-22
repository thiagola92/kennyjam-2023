extends MarginContainer


func start_game():
	get_tree().change_scene_to_file("res://scenes/maps/levels/level1/level1.tscn")


func credits():
	get_tree().change_scene_to_file("res://scenes/screen/credits/credits.tscn")


func exit_game():
	get_tree().quit()
