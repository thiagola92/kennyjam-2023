extends Node2D

@export var x_axis: Array[float]
@export var y_axis: Array[float]

var sounds: Array[String] = [
	"res://assets/sounds/SE/horror_breath_deep_reverb.mp3", 
	"res://assets/sounds/SE/horror_breath_deep_reverb_2.mp3",
	"res://assets/sounds/SE/horror_breath.mp3",
	"res://assets/sounds/SE/door_creak.mp3",
	"res://assets/sounds/SE/footsteps_distant.mp3",
	"res://assets/sounds/SE/scrape_old_floor.mp3"
]

var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	print($Timer.time_left)

func _on_timer_timeout() -> void:
	_start_random_sounds()

func _start_random_sounds () -> void:
	_randomize_position()
	$AudioStreamPlayer2D.stream = load(sounds[rng.randi_range(0, sounds.size() - 1)])
	$AudioStreamPlayer2D.play(0)


func _on_audio_stream_player_2d_finished() -> void:
	$Timer.wait_time = rng.randi_range(10, 30)
	$Timer.start()
	
func _randomize_position () -> void:
	var new_position = Vector2(randf_range(x_axis[0], x_axis[1]), randf_range(y_axis[0], y_axis[1]))
	print(new_position)
	$AudioStreamPlayer2D.position = new_position
