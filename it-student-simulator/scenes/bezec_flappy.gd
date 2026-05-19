extends CharacterBody2D

const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var aktivni = false

func _physics_process(delta: float) -> void:
	if not aktivni:
		return
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	move_and_slide()
