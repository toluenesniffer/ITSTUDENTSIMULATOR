extends Node2D



func _on_ready() -> void:
	
	if not Dialogic.timeline_ended.is_connected(_on_timeline_ended):
		Dialogic.timeline_ended.connect(_on_timeline_ended)
	if(Dialogic.VAR.bohousbufetPlayed == true and Dialogic.VAR.vbufetuPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/vbufetu.dtl")
	else: 
		pass
func _on_timeline_ended():
	TaskUI.update_task("JDI DO UCEBNY NA I")
