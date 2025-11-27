extends Button



func _on_pressed() -> void:
	SFXManager.play("res://music/dvereotevreni.mp3")
	if (Dialogic.VAR.Znamky.telocvikPlayed == true):
		TaskUI.update_task("JDI DO B209 A ZÍSKEJ VYSVĚDČENÍ")
	get_tree().change_scene_to_file("res://scenes/Hallway.tscn")
