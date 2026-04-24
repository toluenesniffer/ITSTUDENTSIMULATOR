extends Button



func _on_pressed() -> void:
	SFXManager.play("res://music/dvereotevreni.mp3")
	if (GlobalData.current_chapter == 1):
		get_tree().change_scene_to_file("res://scenes/PcRoomA.tscn")
	elif (GlobalData.current_chapter == 2):
		get_tree().change_scene_to_file("res://scenes/PcRoomA_ch2.tscn")
	elif(GlobalData.current_chapter == 3):
		get_tree().change_scene_to_file("res://scenes/PcRoomA_ch3.tscn")
