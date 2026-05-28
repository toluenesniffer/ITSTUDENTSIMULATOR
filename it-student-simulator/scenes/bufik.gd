extends Node2D



func _on_ready() -> void:
	if(Dialogic.VAR.bohousbufetPlayed == true and Dialogic.VAR.vbufetuPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/vbufetu.dtl")
	else: 
		pass
func _on_timeline_ended():
	if (Dialogic.VAR.vbufetuPlayed == true and Dialogic.VAR.web3Played == false):
		Dialogic.VAR.kc40 = false
		TaskUI.update_task("JDI DO UCEBNY NA I")
