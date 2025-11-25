extends Button



func _on_pressed() -> void:
	SFXManager.play("res://music/button.mp3")
	get_tree().quit() # Replace with function body.
