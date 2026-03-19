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
	print("!!! DEBUG: Funkce start_fire byla zavolána !!!")
	layer = 100
	visible = true
	timer.wait_time = seconds
	timer.one_shot = true
	timer.start()
	SFXManager.change_music("res://music/alarm.mp3")
	print("Hoří! Máš " + str(seconds) + " sekund!")
func _on_timer_timeout():
	visible = false
	stop_fire()
	get_tree().change_scene_to_file("res://scenes/BadEnding.tscn")
func stop_fire():
	print("!!! DEBUG: Vypínám oheň a skrývám overlay !!!")
	visible = false
	timer.stop()
