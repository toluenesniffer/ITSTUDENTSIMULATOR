extends Button



func _on_pressed() -> void:
	Dialogic.start("res://dialogicYap/intro/jidlo.dtl")


func _on_tortilla_pressed() -> void:
	Dialogic.start("res://dialogicYap/intro/tortilla.dtl")


func _on_gurt_pressed() -> void:
	Dialogic.start("res://dialogicYap/intro/gurt.dtl")
