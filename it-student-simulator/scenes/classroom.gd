extends Control



func _on_ready() -> void:
	#Dialogic.VAR.zavolat = true;
	if(Dialogic.VAR.introPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
	elif(Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/cestina.dtl")
	elif(Dialogic.VAR.matikaPlayed == true and Dialogic.VAR.anglictinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/anglictina.dtl")
