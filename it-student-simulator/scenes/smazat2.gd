extends Button

const MINIHRA_SCENA = preload("res://scenes/FlappyDeadline.tscn")

func _on_pressed() -> void:
	disabled = true
	var instance_minihry = MINIHRA_SCENA.instantiate()
	add_child(instance_minihry)
