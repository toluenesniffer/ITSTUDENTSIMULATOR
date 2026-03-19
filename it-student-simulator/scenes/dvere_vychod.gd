extends Button





func _on_pressed() -> void:
	if (Dialogic.VAR.dohorelo == true):
		get_tree().change_scene_to_file("res://scenes/BadEnding.tscn")
	else:
		Dialogic.start("res://dialogicYap/Chapter 2/nouzovy_vychod.dtl")
