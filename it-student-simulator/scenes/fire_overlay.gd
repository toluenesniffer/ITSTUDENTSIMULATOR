extends CanvasLayer

@onready var timer = $Timer
@onready var label = $Label
@onready var color_rect = $ColorRect




func _on_ready() -> void:
	visible = false
	timer.stop()
func _process(_delta):
	if not timer.is_stopped():
		label.text = "Čas do výbuchu: " + str(ceil(timer.time_left))
func start_fire(seconds: float):
	visible = true
	timer.wait_time = seconds
	timer.one_shot = true
	timer.start()
	print("Hoří! Máš " + str(seconds) + " sekund!")
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/BadEnding.tscn")
