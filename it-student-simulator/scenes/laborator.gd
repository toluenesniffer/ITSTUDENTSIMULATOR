extends Node2D

var minihra_uz_byla_spustena: bool = false

func _on_ready() -> void:
	if (Dialogic.VAR.inf2Played == true and Dialogic.VAR.elk1Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/elk_druhak.dtl")
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	if (Dialogic.VAR.lednickaHotova == true and Dialogic.VAR.elk2Played == false):
		TaskUI.update_task("SNAŽ SE ZÍSKAT DOBROU ZNÁMKU")
		Dialogic.start("res://dialogicYap/Chapter 2/elk_success.dtl")
func _on_timeline_ended():
	if Dialogic.VAR.elk1Played == true and Dialogic.VAR.lednickaHotova == false:
		var minihra_scena = preload("res://scenes/FridgeMinigame.tscn")
		var minihra_instance = minihra_scena.instantiate()
		add_child(minihra_instance)
