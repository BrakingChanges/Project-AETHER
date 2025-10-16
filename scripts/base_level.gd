extends Node2D

@onready var player_spawn = $PlayerSpawn
@onready var goal = $Goal

func _ready():
	modulate = Color(0.8, 0.9, 1.0) # slight glow tint



func _on_goal_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")
