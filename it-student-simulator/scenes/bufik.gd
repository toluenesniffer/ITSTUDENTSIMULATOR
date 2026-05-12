extends Node2D



func _on_ready() -> void:
	if(Dialogic.VAR.bohousbufetPlayed == true and Dialogic.VAR.vbufetuPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/vbufetu.dtl")
	else: 
		pass
