extends Node2D

func _ready():
	modulate = Color(0.8, 0.9, 1.0) # slight glow tint
	
	DiscordRPC.state = "Playing Level 1!"
	DiscordRPC.refresh()




#func _on_goal_body_entered(body: Node2D) -> void:
	##if body.is_in_group("player"):
		##$CanvasLayer/GameOverScreen.show()
	##else:
		##$CanvasLayer/GameOverScreen.hide()
