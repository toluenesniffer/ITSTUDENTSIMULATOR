extends Button



func _on_pressed() -> void:
	if (Dialogic.VAR.fyzikaPlayed == false):
		Dialogic.start("res://dialogicYap/intro/Horymirdefault.dtl")
	else: 
		Dialogic.start("res://dialogicYap/intro/Horymiryap.dtl")
