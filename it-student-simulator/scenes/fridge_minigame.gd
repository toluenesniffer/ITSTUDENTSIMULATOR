extends CanvasLayer

@onready var dial = $Dial
@onready var temp_label = $TempLabel

var hold_timer: float = 0.0
var rychlost_toceni: float = 0.05

var current_temp: int = 20
var target_temp: int = 67
var min_temp: int = -50
var max_temp: int = 100

var game_won: bool = false



func _on_ready() -> void:
	update_ui()
func _process(delta: float) -> void:
	if  game_won == true:
		return
	if Input.is_action_pressed("ui_right"):
		hold_timer -= delta
		if hold_timer <= 0:
			current_temp += 1
			change_temp()
			hold_timer = rychlost_toceni
	elif Input.is_action_pressed("ui_left"):
		hold_timer -= delta
		if hold_timer <= 0:
			current_temp -= 1
			change_temp()
			hold_timer = rychlost_toceni
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		hold_timer = 0.0
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
		Dialogic.VAR.lednickaHotova = true
		Dialogic.start("elk_success")
		queue_free()
