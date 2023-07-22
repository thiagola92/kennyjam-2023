extends Node



var last_checkpoint: PackedScene:
	get:
		if last_checkpoint == null:
			return preload("res://scenes/maps/levels/level1/level1.tscn")
		return last_checkpoint
