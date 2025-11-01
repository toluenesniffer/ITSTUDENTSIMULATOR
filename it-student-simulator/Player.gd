extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	var anim_sprite = $AnimatedSprite2D
	if direction:
		anim_sprite.play("chuze")
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
	
		
