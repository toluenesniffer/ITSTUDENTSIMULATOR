extends Control



func _on_ready() -> void:
	#Dialogic.VAR.zavolat = true;
	if(Dialogic.VAR.introPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Intro.dtl")
