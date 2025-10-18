extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
@export var player: PlayerController
@onready var timer = $Timer

func _ready() -> void:
	var child_spawners: Array[Node] = get_children()
	
	for child in child_spawners:
		if not (child is Timer):
			var instance: EnemyController = enemy.instantiate()
			add_child(instance)
			instance.position = child.position
			instance.player = player


func _on_timer_timeout() -> void:
	var child_spawners: Array[Node] = get_children()
	
	for child in child_spawners:
		if not (child is Timer):
			var instance: EnemyController = enemy.instantiate()
			add_child(instance)
			instance.position = child.position
			instance.player = player
	
	timer.start(10)

	
