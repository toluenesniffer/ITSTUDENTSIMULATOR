extends Control

signal minigame_success
signal minigame_failed

var bar_value = 0.0
var decay_speed = 50.0 
var jump_force = 15.0 
var target_min = 40.0 
var target_max = 70.0

@onready var progress_bar = $ProgressBar
@onready var game_timer = $Timer


func _on_ready() -> void:
	game_timer.wait_time = 15.0
	game_timer.one_shot = true
	game_timer.timeout.connect(_on_time_up)

	progress_bar.min_value = 0
	progress_bar.max_value = 100
	progress_bar.value = 0
	
	set_process(false)
	
func start_game():
	bar_value = 0.0
	set_process(true)
	game_timer.start()
	visible = true
func _process(delta: float) -> void:
	bar_value -= decay_speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		bar_value += jump_force
	bar_value = clamp(bar_value, 0, 100)
	progress_bar.value = bar_value
	if bar_value >= target_min and bar_value <= target_max:
		progress_bar.modulate = Color.GREEN
	else:
		progress_bar.modulate = Color.RED
func _on_time_up():
	set_process(false)
	if bar_value >= target_min and bar_value <= target_max:
		emit_signal("minigame_success")
	else:
		emit_signal("minigame_failed")
	queue_free()
