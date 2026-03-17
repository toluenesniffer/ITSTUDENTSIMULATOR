extends Button



func _on_pressed() -> void:
	if(GlobalData.current_chapter == 1):
		if (Dialogic.VAR.fyzikaPlayed == false and Dialogic.VAR.kamos2 == false):
			Dialogic.start("res://dialogicYap/intro/Horymirdefault.dtl")
		elif (Dialogic.VAR.fyzikaPlayed == true and Dialogic.VAR.kamos2 == false): 
			Dialogic.start("res://dialogicYap/intro/Horymiryap.dtl")
		else:
			Dialogic.start("res://dialogicYap/intro/Horymirkamos.dtl")
	elif(GlobalData.current_chapter == 2):
		if (Dialogic.VAR.horymir2Played == true):
			Dialogic.start("res://dialogicYap/intro/Horymirkamos.dtl")
		elif (Dialogic.VAR.kybisky2Played == true):
			Dialogic.start("res://dialogicYap/Chapter 2/horymir_druhak.dtl")
		else:
			Dialogic.start("res://dialogicYap/intro/Horymirkamos.dtl")
func _on_timeline_ended():
	if (Dialogic.VAR.horymir2Played == true and Dialogic.VAR.cestina2Played == false):
		TaskUI.update_task("JDI DO B209")


func _on_ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
