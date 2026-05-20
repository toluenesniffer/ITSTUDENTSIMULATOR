extends Node2D

const RYCHLOST = 200.0

func _process(delta: float) -> void:
	position.x -= RYCHLOST * delta
	if position.x < -100:
		queue_free()
 
