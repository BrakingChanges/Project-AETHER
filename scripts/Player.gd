extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0
@export var background_sprite: Sprite2D
@export var health_label: Label
@export var void_line: Line2D

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0
var health = 2
var jumps = 0
var locked = false
var locked_node: Node2D = null
var previous_locked_position: Vector2 = Vector2(0, 0)


func _physics_process(delta: float) -> void:
	background_sprite.position = position
	health_label.text = "Health: " + str(health)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps = 0
	
	if void_line.points[0].y < position.y:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or jumps <= 1):
		velocity.y = jump_power * jump_multiplier
		jumps += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	
	for i in range(collision_count):
		var collision = get_slide_collision(i)
		var collider: Node = collision.get_collider()
		
		if collider.is_in_group("enemy"):
			$Timer.start(0.5)
		
		if collider.is_in_group("metro"):
			locked = true
			locked_node = collider
		
	if locked:
		if Input.is_action_just_pressed("jump"):
			locked = false
		
		if locked_node:
			var motion = locked_node.position - previous_locked_position
			position += motion
			previous_locked_position = locked_node.position
			
		

			
			
	
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
			


func _on_timer_timeout() -> void:
	health -= 1
