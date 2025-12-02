extends Button




func _on_pressed() -> void:
	SFXManager.play("res://music/button.mp3")
	get_tree().change_scene_to_file("res://scenes/Mainscreen.tscn")
