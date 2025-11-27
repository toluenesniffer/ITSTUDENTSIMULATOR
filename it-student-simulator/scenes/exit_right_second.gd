extends Area2D

@export var target_scene: String = "res://scenes/telocvicna.tscn"
@export var spawn_position: String = "left"

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	print("ExitRight: Body entered! Name: ", body.name, " Type: ", body.get_class())
	if body is CharacterBody2D:
		print("ExitRight: Player detected!")
		GlobalScript.player_spawn_side = spawn_position
		get_tree().change_scene_to_file(target_scene)
