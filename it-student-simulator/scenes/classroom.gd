extends Control

var byl_na_chodbe = false

func _on_ready() -> void:
	#Dialogic.VAR.zavolat = true;
	if(Dialogic.VAR.introPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
	elif(Dialogic.VAR.byl_na_chodbe == true and Dialogic.VAR.cestinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/cestina.dtl")
		
