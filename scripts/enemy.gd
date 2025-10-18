extends CharacterBody2D
class_name EnemyController

@onready var player: CharacterBody2D
@export var speed = 5

var speed_multiplier = 30.0

func _physics_process(delta: float) -> void:
	var direction = (player.position - position).normalized()
	velocity.x = direction.x * speed * speed_multiplier
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	
