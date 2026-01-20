extends Control



func _on_ready() -> void:
	if(Dialogic.VAR.dstartPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 2/druhak_start.dtl")
		
func _on_timeline_ended():
	print("--- KONEC TIMELINE ---")
	print("Timeline skončila. Hodnota kamos je: ", Dialogic.VAR.kamos)
	SFXManager.change_music("res://music/normalnihudba.mp3")
	#var task_ui_node = get_node("/root/TaskUI")
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")


func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.dstartPlayed == true and Dialogic.VAR.webisky2Played == false):
		TaskUI.update_task("JDI DO TŘÍDY A306")
