extends CanvasLayer



func _ready() -> void:
	visible = false
func start_blackout():
	visible = true
	print("!!! DEBUG: Blackout spuštěn !!!")
func stop_blackout():
	visible = false
	
