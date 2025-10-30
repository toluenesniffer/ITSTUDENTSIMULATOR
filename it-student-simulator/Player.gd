extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	var anim_sprite = $AnimatedSprite2D
	if direction:
		anim_sprite.play("chuze")
		if direction > 0:
			anim_sprite.flip_h = false
		elif direction < 0:
			anim_sprite.flip_h = true
	else:
		
