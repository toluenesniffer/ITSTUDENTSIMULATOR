extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
const SPEED = 300

func _physics_process(_delta) -> void:
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
		position.x = 100
	elif GlobalScript.player_spawn_side == "right":
		position.x = 900
	print("Player spawned at: ", position.x)
	sprite.animation_finished.connect(_on_animation_changed)
	sprite.animation_changed.connect(_on_animation_changed)
	
func _on_animation_changed():
	if sprite.animation == "walk":
		sprite.offset = Vector2(-750, -500)
	elif sprite.animation == "idle":
		sprite.offset = Vector2(-750, -500)
