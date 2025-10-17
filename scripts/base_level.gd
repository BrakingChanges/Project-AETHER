extends Node2D

func _ready():
	modulate = Color(0.8, 0.9, 1.0) # slight glow tint



func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")
