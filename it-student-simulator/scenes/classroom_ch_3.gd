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
