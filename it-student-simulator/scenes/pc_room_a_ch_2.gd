extends Node2D

var signals_connected = false
func _on_ready() -> void:
	if !signals_connected:
		Dialogic.timeline_started.connect(_on_timeline_started)
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		signals_connected = true
	if(Dialogic.VAR.dstartPlayed == true and Dialogic.VAR.webisky2Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/webisky_druhak.dtl")
	elif(Dialogic.VAR.hardwarePlayed == true and Dialogic.VAR.grafika1Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/grafika_druhak.dtl")
	elif(Dialogic.VAR.GondraPlayed == true and Dialogic.VAR.grafika2Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/grafika_druhak2.dtl")
	elif(Dialogic.VAR.zachranenPlayed == true and Dialogic.VAR.grafika3Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/grafika_druhak3.dtl")
	elif(Dialogic.VAR.mikroelkPlayed == true and Dialogic.VAR.inf2Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/informatika_druhak.dtl")
	else:
		pass
func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")
func _on_timeline_ended():
	SFXManager.change_music("res://music/normalnihudba.mp3")
	if (Dialogic.VAR.grafika1Played == true and Dialogic.VAR.GondraPlayed == false):
		TaskUI.update_task("JDI NA CHODBU VYFOTIT ONDRU")
	elif (Dialogic.VAR.GondraPlayed == true and Dialogic.VAR.grafika2Played == false):
		TaskUI.update_task("JDI ZPATKY DO TRIDY")
	elif (Dialogic.VAR.grafika2Played == true and Dialogic.VAR.zachranaPlayed == false):
		TaskUI.update_task("JDI ZPET ZA ONDROU")
	elif(Dialogic.VAR.grafika3Played == true and Dialogic.VAR.mikroelkPlayed == false):
		TaskUI.update_task("JDI DO TŘÍDY I")
	elif(Dialogic.VAR.inf2Played == true and Dialogic.VAR.elk1Played == false):
		TaskUI.update_task("JDI DO LABORATOŘE L")
	else:
		TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
		


func _on_button_pressed() -> void:
	if (Dialogic.VAR.webisky2Played == true and Dialogic.VAR.kybisky2Played == false):
		TaskUI.update_task("JDI DO UCEBNY I")
	SFXManager.play("res://music/dvereotevreni.mp3")
