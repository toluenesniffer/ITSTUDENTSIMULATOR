extends Node2D


func _on_ready() -> void:
	if(Dialogic.VAR.cestinaPlayed == true and Dialogic.VAR.prgPlayed == false):
		Dialogic.start("res://dialogicYap/intro/programovani.dtl")
	elif(Dialogic.VAR.elkPlayed == true and Dialogic.VAR.infPlayed == false):
		Dialogic.start("res://dialogicYap/intro/informatika.dtl")
	else:
		pass
