extends BaseLevel

func _ready() -> void:
	DiscordRPC.state = "Playing Level 1!"
	DiscordRPC.refresh()


func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
