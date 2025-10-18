extends BaseLevel



func _ready() -> void:
	Globals.current_level = 1
	DiscordRPC.state = "Playing Level 1!"
	DiscordRPC.refresh()



func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$FadeAnimationUI/AnimationPlayer.play("fade")
		await $FadeAnimationUI/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")


func _on_death_area_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
