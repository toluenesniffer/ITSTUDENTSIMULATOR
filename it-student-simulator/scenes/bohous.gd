extends Button



func _on_pressed() -> void:
	if (Dialogic.VAR.cestina3Played == true and Dialogic.VAR.bohousbufetPlayed == false):
		Dialogic.start("res://dialogicYap/Chapter 3/bohous_bufet.dtl")
	else:
		Dialogic.start("res://dialogicYap/Chapter 2/bohousyap.dtl")
func _on_timeline_ended():
	if (Dialogic.VAR.bohousbufetPlayed == true and Dialogic.VAR.vbufetuPlayed == false):
		TaskUI.update_task("JDI DO BUFETU")


func _ready() -> void:
	if not Dialogic.timeline_ended.is_connected(_on_timeline_ended):
		Dialogic.timeline_ended.connect(_on_timeline_ended)
