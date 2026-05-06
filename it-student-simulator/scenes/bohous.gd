extends Button



func _on_pressed() -> void:
	if (Dialogic.VAR.cestina3Played == true and Dialogic.VAR.bohousbufetPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/bohous_bufet.dtl")
	else:
		Dialogic.start("res://dialogicYap/Chapter 2/bohousyap.dtl")
