extends Node2D

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.prgPlayed == true and Dialogic.VAR.matikaPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/matika.dtl")
	elif(Dialogic.VAR.infPlayed == true and Dialogic.VAR.fyzikaPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/fyzika.dtl")
	elif(Dialogic.VAR.fyzikaPlayed == true and Dialogic.VAR.kamos2 == true and Dialogic.VAR.obcankaPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/obcanka.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")


func _on_button_pressed() -> void:
	if Dialogic.VAR.matikaPlayed == true and Dialogic.VAR.anglictinaPlayed == false:
		TaskUI.update_task("JDI DO TŘÍDY B209")
	elif Dialogic.VAR.fyzikaPlayed == true and Dialogic.VAR.kamos2 == false:
		TaskUI.update_task("NAJDI SI KAMARÁDA")
	#elif Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.kamoska == false:
		#TaskUI.update_task("NAJDI SI KAMARÁDKU")
	elif Dialogic.VAR.obcankaPlayed == true and Dialogic.VAR.dejepisPlayed == false:
		TaskUI.update_task("JDI DO TŘÍDY B209")
	SFXManager.play("res://music/dvereotevreni.mp3")
