extends Button


func _on_pressed() -> void:
	if (GlobalData.current_chapter == 1):
		SFXManager.play("res://music/dvereotevreni.mp3")
		get_tree().change_scene_to_file("res://scenes/Classroom.tscn")
	elif (GlobalData.current_chapter == 2):
		SFXManager.play("res://music/dvereotevreni.mp3")
		get_tree().change_scene_to_file("res://scenes/Classroom_ch2.tscn")
