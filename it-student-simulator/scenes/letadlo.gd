extends Node2D



func _on_ready() -> void:
	TaskUI.hide_task()
	Dialogic.start("res://dialogicYap/Chapter 3/letadlo.dtl")
	Dialogic.timeline_ended.connect(_on_timeline_ended)
func _on_timeline_ended():
	if(Dialogic.VAR.letadloPlayed == true):
		get_tree().change_scene_to_file("res://scenes/deportace.tscn")
