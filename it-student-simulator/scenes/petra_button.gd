extends Button


func _on_pressed() -> void:
	if (Dialogic.VAR.anglictinaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Petradefault.dtl")
	else: 
		Dialogic.start("res://dialogicYap/intro/Petrayap.dtl")
