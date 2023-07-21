extends Node2D


var current: int = 0

@export var intervals: Array[float] = [1]


func _ready() -> void:
	start_next_interval()


func start_next_interval() -> void:
	if intervals.is_empty():
		return
	
	if current >= intervals.size():
		current = 0
	
	$Timer.wait_time = intervals[current]
	$PointLight2D.visible = not $PointLight2D.visible
	
	current += 1
