extends Node2D

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.cestinaPlayed == true and Dialogic.VAR.prgPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/programovani.dtl")
	elif(Dialogic.VAR.elkPlayed == true and Dialogic.VAR.infPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/informatika.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")


func _on_button_pressed() -> void:
	if (Dialogic.VAR.prgPlayed == true and Dialogic.VAR.matikaPlayed == false):
		TaskUI.update_task("JDI DO TŘÍDY A307")
	elif Dialogic.VAR.infPlayed == true and Dialogic.VAR.fyzikaPlayed == false:
		TaskUI.update_task("JDI DO TŘÍDY A307")
	SFXManager.play("res://music/dvereotevreni.mp3")
