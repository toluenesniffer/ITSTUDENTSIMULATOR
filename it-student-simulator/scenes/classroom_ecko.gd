extends Node2D

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.matika2Played == true and Dialogic.VAR.hardwarePlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/hardware_druhak.dtl")
	else:
		pass
		
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")
	if (Dialogic.VAR.hardwarePlayed == true and Dialogic.VAR.mikroelkPlayed == false):
		TaskUI.update_task("JDI DO UCEBNY A306")
