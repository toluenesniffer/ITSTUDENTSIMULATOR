extends Button



func _on_pressed() -> void:
	if (GlobalData.current_chapter == 3 and Dialogic.VAR.milan3Played == false):
		Dialogic.start("res://dialogicYap/Chapter 3/milan_tretak.dtl")
	else:
		Dialogic.start("res://dialogicYap/Chapter 2/milanyap.dtl")
func _on_timeline_ended():
	if (Dialogic.VAR.milan3Played == true and Dialogic.VAR.matika3Played == false):
		TaskUI.update_task("JDI DO A307")


func _ready() -> void:
	if not Dialogic.timeline_ended.is_connected(_on_timeline_ended):
		Dialogic.timeline_ended.connect(_on_timeline_ended)
