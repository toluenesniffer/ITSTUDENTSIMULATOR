extends Control


var door_sfx = preload("res://music/dvereotevreni.mp3")
var signals_connected = false

func _on_ready() -> void:
	var task_ui_node = get_node("/root/TaskUI")
	if task_ui_node:
		task_ui_node.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	else:
		print("ERROR: TaskUI not found in scene tree!")
	print("Music playing: ", SFXManager.music_player.playing)
	print("Current music: ", SFXManager.current_music)
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	#Dialogic.VAR.zavolat = true;
	if(Dialogic.VAR.introPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
		
	elif(Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/cestina.dtl")
	elif(Dialogic.VAR.matikaPlayed == true and Dialogic.VAR.anglictinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/anglictina.dtl")
	elif(Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.elkPlayed == false):
		Dialogic.start("res://dialogicYap/intro/elektrotechnika.dtl")
	elif(Dialogic.VAR.obcankaPlayed == true and Dialogic.VAR.dejepisPlayed == false):
		Dialogic.start("res://dialogicYap/intro/dejepis.dtl")
	else:
		pass
		
		
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	SFXManager.change_music("res://music/normalnihudba.mp3")
	TaskUI.update_task("VYBER SI DALŠÍ TŘÍDU")

func _on_button_hallway_pressed() -> void:
	SFXManager.play("res://music/dvereotevreni.mp3")
