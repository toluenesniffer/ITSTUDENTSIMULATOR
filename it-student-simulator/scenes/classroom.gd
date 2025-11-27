extends Control


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
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
		
	elif(Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/cestina.dtl")
	elif(Dialogic.VAR.matikaPlayed == true and Dialogic.VAR.anglictinaPlayed == false):
		TaskUI.update_task("NAPIŠ SPRÁVNĚ SLOVA ANGLICKY")
		Dialogic.start("res://dialogicYap/intro/anglictina.dtl")
	elif(Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.elkPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/elektrotechnika.dtl")
	elif(Dialogic.VAR.obcankaPlayed == true and Dialogic.VAR.dejepisPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/intro/dejepis.dtl")
	else:
		pass
		
		
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	print("--- KONEC TIMELINE ---")
	print("Timeline skončila. Hodnota kamos je: ", Dialogic.VAR.kamos)
	SFXManager.change_music("res://music/normalnihudba.mp3")
	#var task_ui_node = get_node("/root/TaskUI")
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	if Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false:
		print("Mám kámoše! Měním úkol na B209")
		TaskUI.update_task("VRAŤ SE DO TŘÍDY B209")
	else:
		print("Podmínka nesplněna.")
	
func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.kamos == false):
		TaskUI.update_task("NAJDI SI KAMARÁDA")
	elif (Dialogic.VAR.kamos == true and Dialogic.VAR.prgPlayed == false):
		TaskUI.update_task("JDI DO TŘÍDY A306")
	elif Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.elkPlayed == false:
		TaskUI.update_task("JDI ZPĚT DO TŘÍDY B209")
	elif Dialogic.VAR.elkPlayed == true and Dialogic.VAR.infPlayed == false:
		TaskUI.update_task("JDI DO TŘÍDY A306")
	SFXManager.play("res://music/dvereotevreni.mp3")
