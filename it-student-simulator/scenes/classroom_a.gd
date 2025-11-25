extends Node2D

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.prgPlayed == true and Dialogic.VAR.matikaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/matika.dtl")
	elif(Dialogic.VAR.infPlayed == true and Dialogic.VAR.fyzikaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/fyzika.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	SFXManager.change_music("res://music/normalnihudba.mp3")
