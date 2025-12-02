extends Button


func _on_pressed() -> void:
	if (Dialogic.VAR.anglictinaPlayed == false and Dialogic.VAR.kamoska == false):
		Dialogic.start("res://dialogicYap/intro/Petradefault.dtl")
	elif (Dialogic.VAR.anglictinaPlayed == true and Dialogic.VAR.kamoska == false): 
		Dialogic.start("res://dialogicYap/intro/Petrayap.dtl")
	else:
		Dialogic.start("res://dialogicYap/intro/Petrakamoska.dtl")
