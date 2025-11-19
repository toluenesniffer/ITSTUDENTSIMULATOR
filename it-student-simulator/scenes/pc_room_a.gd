extends Node2D


func _on_ready() -> void:
	if(Dialogic.VAR.prgPlayed == false):
		Dialogic.start("res://dialogicYap/intro/programovani.dtl")
