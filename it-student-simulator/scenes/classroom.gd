extends Control

@onready var task_ui = $CanvasLayer

var door_sfx = preload("res://music/dvereotevreni.mp3")
var signals_connected = false

func _on_ready() -> void:
	print("Music playing: ", SFXManager.music_player.playing)
	print("Current music: ", SFXManager.current_music)
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	#Dialogic.VAR.zavolat = true;
	if(Dialogic.VAR.introPlayed == false):
		task_ui.hide_task()
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
	elif(Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/cestina.dtl")
	elif(Dialogic.VAR.matikaPlayed == true and Dialogic.VAR.anglictinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/anglictina.dtl")
	elif(Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.elkPlayed == false):
		Dialogic.start("res://dialogicYap/intro/elektrotechnika.dtl")
	else:
		pass
		
		
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	SFXManager.change_music("res://music/normalnihudba.mp3")
	task_ui.show_task("JDI VEN (KLIKNI NA DVEŘE)")

func _on_button_hallway_pressed() -> void:
	SFXManager.play("res://music/dvereotevreni.mp3")
