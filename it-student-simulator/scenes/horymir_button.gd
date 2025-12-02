extends Button



func _on_pressed() -> void:
	if (Dialogic.VAR.fyzikaPlayed == false and Dialogic.VAR.kamos2 == false):
		Dialogic.start("res://dialogicYap/intro/Horymirdefault.dtl")
	elif (Dialogic.VAR.fyzikaPlayed == true and Dialogic.VAR.kamos2 == false): 
		Dialogic.start("res://dialogicYap/intro/Horymiryap.dtl")
	else:
		Dialogic.start("res://dialogicYap/intro/Horymirkamos.dtl")
