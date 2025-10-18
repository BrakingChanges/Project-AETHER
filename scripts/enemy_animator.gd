extends Node2D

@export var enemy: EnemyController

func _process(delta: float) -> void:
	if enemy.velocity.x == 0:
		$AnimationPlayer.play("idle")
	elif abs(enemy.velocity.x) > 0:
		$AnimationPlayer.play("move")
	
	if enemy.velocity.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
