extends BaseLevel

func _ready() -> void:
	$FadeAnimationUI/AnimationPlayer.play("unfade")
	await $FadeAnimationUI/AnimationPlayer.animation_finished
	Globals.current_level = 2
	DiscordRPC.state = "Playing Level 2!"
	DiscordRPC.refresh()

func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/special_scene.tscn")
