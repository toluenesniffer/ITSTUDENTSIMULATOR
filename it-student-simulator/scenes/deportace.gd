extends Node2D

@onready var exit_button = $Exit



func _on_ready() -> void:
	SFXManager.change_music("res://music/sad ost.mp3")
	TaskUI.hide_task()
	exit_button.visible = true
	create_tween().tween_property(exit_button, "modulate:a", 1.0, 1.0).from(0.0)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Mainscreen.tscn")
