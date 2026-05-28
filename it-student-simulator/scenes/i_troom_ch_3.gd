extends Node2D

const MINIHRA_SCENA = preload("res://scenes/switchscene.tscn")
const MINIHRA_FLAPPY = preload("res://scenes/FlappyDeadline.tscn")

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
	if(Dialogic.VAR.site3Played == true and Dialogic.VAR.rprIntro == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/rpr_tretak.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")
	if Dialogic.VAR.siteevakuace == true:
		print("TEST: Počítač vybouchl, spouštím evakuaci!")
		FireSystem.start_fire(60.0)
		Dialogic.VAR.dohorelo = true
		TaskUI.update_task("NAJDI NOUZOVY VYCHOD")
		Dialogic.VAR.siteevakuace = false
		if has_node("Switchscene"):
			$Switchscene.queue_free()
		if Dialogic.VAR.zpusobil_blackout == true:
			BlackoutSystem.start_blackout()
			Dialogic.VAR.blackout = false


func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.kybisky3Played == true and Dialogic.VAR.aj3Played == false):
		TaskUI.update_task("JDI DO TRIDY B209")
	elif(Dialogic.VAR.mir3Played == true and Dialogic.VAR.milan3Played == false):
		TaskUI.update_task("JDI ZA MILANEM")
	elif(Dialogic.VAR.osy3Played == true and Dialogic.VAR.cestina3Played == false):
		TaskUI.update_task("JDI DO TRIDY B209")
	elif(Dialogic.VAR.web3Played == true and Dialogic.VAR.obcanka3Played == false):
		TaskUI.update_task("JDI NA A307")
	elif(Dialogic.VAR.site3Played == true and Dialogic.VAR.rprPlayed == false):
		TaskUI.update_task("JDI ZASE NA I")
	elif(Dialogic.VAR.rprPlayed == true and Dialogic.VAR.boss1 == false):
		TaskUI.update_task("JDI DO TĚLOCVIČNY.")
		
		
func _on_dialogic_signal(argument: String):
	if argument == "start_switch":
		spust_minihru()
	if argument == "start_flappy":
		spust_minihru_flappy()
func spust_minihru():
	var instance_minihry = MINIHRA_SCENA.instantiate()
	add_child(instance_minihry)
func spust_minihru_flappy():
	var instance_minihry = MINIHRA_FLAPPY.instantiate()
	add_child(instance_minihry)
func minihra_skoncila():
	Dialogic.start("res://dialogicYap/Chapter 3/postrpr.dtl")
	
