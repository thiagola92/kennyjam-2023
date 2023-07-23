extends Node2D

var current: int = 0

@export var intervals: Array[float] = [1]
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	fill_array_randomly()
	start_next_interval()


func start_next_interval() -> void:
	if intervals.is_empty():
		return
	
	if current >= intervals.size():
		current = 0
	
	$Timer.wait_time = intervals[current]
	$PointLight2D.visible = not $PointLight2D.visible
	
	current += 1

func get_random_for_array_size() -> int:
	return rng.randi_range(1, 15)


func fill_array_randomly() -> void:
	var size = get_random_for_array_size()
	
	while size > 0:
		intervals.push_back(rng.randf_range(0.2, 2))
		size = size - 1
