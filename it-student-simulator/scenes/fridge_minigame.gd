extends CanvasLayer

@onready var dial = $Dial
@onready var temp_label = $TempLabel

var current_temp: int = 20
var target_temp: int = 67
var min_temp: int = -50
var max_temp: int = 100

var game_won: bool = false



func _on_ready() -> void:
	update_ui()
func _process(delta: float) -> void:
	if game_won:
		return
	if Input.is_action_just_pressed("ui_right"):
		current_temp += 1
		change_temp()
	elif Input.is_action_just_pressed("ui_left"):
		current_temp -= 1
		change_temp()
func change_temp():
	current_temp = clamp(current_temp, min_temp, max_temp)
	dial.rotation_degrees = current_temp * 4
	update_ui()
	check_win()
func update_ui():
	temp_label.text = str(current_temp) + " °C"
func check_win():
	if current_temp == target_temp:
		game_won = true
		temp_label.text = "67 °C - HOTOVO!"
		temp_label.modulate = Color.GREEN
		#tady pridat do dialogic ze hra je done
		print("Úkol splněn!")
		await get_tree().create_timer(1.5).timeout
		#Dialogic.VAR.lednickaHotova = true
		queue_free()
