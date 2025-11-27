extends CanvasLayer

@onready var label: Label = $TaskLabel


func _ready():
	print("TaskUI loaded")
	print("Label exists: ", label != null)
	if label:
		print("Label name: ", label.name)
	hide_task()

func show_task(task_text: String):
	if !label:
		print("ERROR: Label not found!")
		return
	label.text = task_text
	label.visible = true
	print("Showing task: ", task_text)
func hide_task():
	if !label:
		return
	label.visible = false
func update_task(new_text: String):
	if !label:
		return
	label.text = new_text


func _on_ready() -> void:
	Dialogic.timeline_ended.connect(_on_dialogic_ended)
	
func _on_dialogic_ended():
	if Dialogic.VAR.kamos == true and Dialogic.VAR.cestinaPlayed == false:
		update_task("VRAŤ SE DO TŘÍDY B209")
	elif Dialogic.VAR.kamoska == true and Dialogic.VAR.elkPlayed == false:
		TaskUI.update_task("JDI ZPĚT DO TŘÍDY B209")
	elif Dialogic.VAR.kamos2 == true and Dialogic.VAR.obcankaPlayed == false:
		TaskUI.update_task("JDI ZPĚT DO TŘÍDY A307")
	elif Dialogic.VAR.obcankaPlayed == true and Dialogic.VAR.dejepisPlayed == false:
		update_task("JDI DO TŘÍDY B209")
	
func set_color_danger():
	if !label:
		return
	label.add_theme_color_override("font_color", Color.RED)
func reset_color():
	if !label:
		return
	label.remove_theme_color_override("font_color")
