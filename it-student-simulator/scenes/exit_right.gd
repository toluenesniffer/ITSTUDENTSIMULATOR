extends Area2D

@export var target_scene: String = "res://scenes/Hallway.tscn"
@export var spawn_position: String = "left"

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		GlobalScript.player_spawn_side = spawn_position
		get_tree().change_scene_to_file(target_scene)
