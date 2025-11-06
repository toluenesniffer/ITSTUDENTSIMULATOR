extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
const SPEED = 300

func _physics_process(delta) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	var anim_sprite = $AnimatedSprite2D
	if direction:
		anim_sprite.play("walk")
		velocity.x = direction * SPEED
	var sprite = $AnimatedSprite2D
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	else:
		velocity.x = 0
		anim_sprite.play("idle")
	move_and_slide()
	
func _ready():
	if GlobalScript.player_spawn_side == "left":
		position.x = 250
		position.y = 500
	elif GlobalScript.player_spawn_side == "right":
		position.x = 900
		position.y = 500
	print("Player spawned at: ", position.x)
	
