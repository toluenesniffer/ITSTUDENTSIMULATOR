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
