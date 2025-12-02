extends Button


func _on_pressed() -> void:
	if (Dialogic.VAR.kamos == false):
		Dialogic.start("res://dialogicYap/intro/Ondrayap.dtl")
	else:
		Dialogic.start("res://dialogicYap/intro/ondrakamos.dtl")
