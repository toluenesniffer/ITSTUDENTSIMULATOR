extends Control

const MAIN_SCREEN_PATH = "res://scenes/Mainscreen.tscn"
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_SCREEN_PATH)
