extends Area2D

@export var target_scene: String = "res://scenes/Corridor.tscn"
@export var spawn_position: String = "right"


func _init():
	print("ExitLeft script INIT!")
func _ready():
	print("ExitLeft _ready START")
	body_entered.connect(_on_body_entered)
func _on_body_entered(body):
	print("Something entered: ", body.name)
	if body.is_in_group("player"):
		print("Player detected! Changing scene...")
		GlobalScript.player_spawn_side = spawn_position
		get_tree().change_scene_to_file(target_scene)
