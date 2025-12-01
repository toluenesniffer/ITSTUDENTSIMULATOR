extends Node2D

@onready var volume_slider = $Volume
@onready var speed_slider = $Speed




func _on_ready() -> void:
	speed_slider.value = GlobalData.player_speed
	volume_slider.value = GlobalData.master_volume


func _on_volume_value_changed(value: float) -> void:
	GlobalData.master_volume = value
	AudioServer.set_bus_volume_db(0, linear_to_db(value))


func _on_speed_value_changed(value: float) -> void:
	GlobalData.player_speed = value
