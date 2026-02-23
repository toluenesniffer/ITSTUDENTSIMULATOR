extends Node2D

@onready var exit_button = $Exit

func _on_ready() -> void:
	exit_button.visible = false
	
	TaskUI.hide_task()
	Dialogic.start("res://dialogicYap/Chapter 2/badending.dtl")
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	exit_button.visible = true
	create_tween().tween_property(exit_button, "modulate:a", 1.0, 1.0).from(0.0)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Mainscreen.tscn")
