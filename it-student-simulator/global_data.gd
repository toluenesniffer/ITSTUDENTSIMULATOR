extends Node

var is_dialog_active = false
var player_speed = 300.0
var master_volume = 1.0

func _ready():
	Dialogic.timeline_started.connect(_on_dialog_started)
	Dialogic.timeline_ended.connect(_on_dialog_ended)
	
func _on_dialog_started():
	is_dialog_active = true
func _on_dialog_ended():
	is_dialog_active = false
