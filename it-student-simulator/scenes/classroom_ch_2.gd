extends Control

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.dstartPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 2/druhak_start.dtl")
	elif(Dialogic.VAR.horymir2Played == true and Dialogic.VAR.cestina2Played == false):
		Dialogic.start("res://dialogicYap/Chapter 2/cestina_druhak.dtl")
	else:
		pass
		
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")

func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.dstartPlayed == true and Dialogic.VAR.webisky2Played == false):
		TaskUI.update_task("JDI DO TŘÍDY A306")
	#elif (Dialogic.VAR.cestina2Played == true and Dialogic.VAR.matika2Played == false):
