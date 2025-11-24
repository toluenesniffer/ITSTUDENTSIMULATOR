extends Node2D


func _on_ready() -> void:
	if(Dialogic.VAR.prgPlayed == true and Dialogic.VAR.matikaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/matika.dtl")
	elif(Dialogic.VAR.infPlayed == true and Dialogic.VAR.fyzikaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/fyzika.dtl")
	else:
		pass
