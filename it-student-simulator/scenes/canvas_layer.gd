extends CanvasLayer

@onready var task_label = $TaskLabel

func show_task(text: String):
	if task_label:
		task_label.text = text
		task_label.visible = true
	else:
		print("ERROR: TaskLabel nenalezen!")
func hide_task():
	if task_label:
		task_label.visible = false
	else:
		print("ERROR: TaskLabel nenalezen!")
