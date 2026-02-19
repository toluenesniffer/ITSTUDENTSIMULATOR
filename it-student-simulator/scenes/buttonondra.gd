extends Button


func _on_pressed() -> void:
	if (GlobalData.current_chapter == 1):
		if (Dialogic.VAR.kamos == false):
			Dialogic.start("res://dialogicYap/intro/Ondrayap.dtl")
		else:
			Dialogic.start("res://dialogicYap/intro/ondrakamos.dtl")
	elif (GlobalData.current_chapter == 2):
		if(Dialogic.VAR.grafika1Played == true and Dialogic.VAR.GondraPlayed == false):
			Dialogic.start("res://dialogicYap/Chapter 2/grafika_ondra1.dtl")
		elif(Dialogic.VAR.grafika2Played == true and Dialogic.VAR.zachranaPlayed == false):
			Dialogic.start("res://dialogicYap/Chapter 2/zachrana_ondry.dtl")
		else:
			Dialogic.start("res://dialogicYap/intro/ondrakamos.dtl")
