extends Node2D

const MINIHRA_SCENA = preload("res://scenes/switchscene.tscn")

var signals_connected = false

func _on_ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.tstartPlayed == true and Dialogic.VAR.kybisky3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/kybisky_tretak.dtl")
	if(Dialogic.VAR.ekonomikaPlayed == true and Dialogic.VAR.mir3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/mir_tretak.dtl")
	if(Dialogic.VAR.matika3Played == true and Dialogic.VAR.osy3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/osy_tretak.dtl")
	if(Dialogic.VAR.vbufetuPlayed == true and Dialogic.VAR.web3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/weby_tretak.dtl")
	if(Dialogic.VAR.obcanka3Played == true and Dialogic.VAR.siteIntro == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/site_tretak.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")


func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.kybisky3Played == true and Dialogic.VAR.aj3Played == false):
		TaskUI.update_task("JDI DO TRIDY B209")
	elif(Dialogic.VAR.mir3Played == true and Dialogic.VAR.milan3Played == false):
		TaskUI.update_task("JDI ZA MILANEM")
	elif(Dialogic.VAR.osy3Played == true and Dialogic.VAR.cestina3Played == false):
		TaskUI.update_task("JDI DO TRIDY B209")
		
func _on_dialogic_signal(argument: String):
	if argument == "start_switch":
		spust_minihru()
func spust_minihru():
	var instance_minihry = MINIHRA_SCENA.instantiate()
	add_child(instance_minihry)
	
