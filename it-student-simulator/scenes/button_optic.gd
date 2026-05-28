extends Button



func _on_pressed() -> void:
	Dialogic.start("res://dialogicYap/Chapter 3/optika_site.dtl")
	get_parent().queue_free()
