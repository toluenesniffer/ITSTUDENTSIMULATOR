extends Button


func _on_pressed() -> void:
	GlobalData.load_game()
	SFXManager.play("res://music/button.mp3")
	GlobalData.current_chapter = 2
	if GlobalData.current_chapter == 2:
		get_tree().change_scene_to_file("res://scenes/Classroom_ch2.tscn")
	
