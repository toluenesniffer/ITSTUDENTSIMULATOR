extends Control

var signals_connected = false

func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.tstartPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/tretakstart.dtl")
	elif(Dialogic.VAR.kybisky3Played == true and Dialogic.VAR.aj3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/ajina_tretak.dtl")
	elif(Dialogic.VAR.telak3_1Played == true and Dialogic.VAR.ekonomikaPlayed == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/ekonomie_tretak.dtl")
	elif(Dialogic.VAR.osy3Played == true and Dialogic.VAR.cestina3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 3/cestina_tretak.dtl")
	elif (Dialogic.VAR.boss2 == true and Dialogic.VAR.vyzo3Played == false):
		GlobalData.fixgrades()
		TaskUI.update_task("ZÍSKEJ VYSVĚDČENÍ")
		Dialogic.start("res://dialogicYap/Chapter 3/vysvedceni_tretak.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	SFXManager.change_music("res://music/normalnihudba.mp3")

func _on_button_hallway_pressed() -> void:
	if (Dialogic.VAR.tstartPlayed == true and Dialogic.VAR.kybisky3Played == false):
		TaskUI.update_task("JDI DO UČEBNY NA I")
	elif(Dialogic.VAR.aj3Played == true and Dialogic.VAR.prg3Played == false):
		TaskUI.update_task("JDI DO UCEBNY A306")
	elif(Dialogic.VAR.ekonomikaPlayed == true and Dialogic.VAR.mir3Played == false):
		TaskUI.update_task("JDI DO UCEBNY NA I")
	elif(Dialogic.VAR.cestina3Played == true and Dialogic.VAR.bohousbufetPlayed == false):
		TaskUI.update_task("NAPSAL TI BOHOUS ZE CHCE S TEBOU DO BUFIKU. NAJDI HO.")
func _on_dialogic_signal(argument: String):
	if argument == "vyzo":
		get_tree().change_scene_to_file("res://scenes/continuetretak.tscn")
