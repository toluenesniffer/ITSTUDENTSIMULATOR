extends Button



func _on_pressed() -> void:
	if (GlobalData.current_chapter == 3 and Dialogic.VAR.milan3Played == false):
		Dialogic.start("res://dialogicYap/Chapter 3/milan_tretak.dtl")
	else:
		Dialogic.start("res://dialogicYap/Chapter 2/milanyap.dtl")
