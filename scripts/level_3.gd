extends Node2D

func _ready() -> void:
	$FadeAnimationUI/AnimationPlayer.play("unfade")
	await $FadeAnimationUI/AnimationPlayer.animation_finished
	Globals.current_level = 3
	DiscordRPC.state = "Playing Level 3!"
	DiscordRPC.refresh()


func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$FadeAnimationUI/AnimationPlayer.play("fade")
		await $FadeAnimationUI/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/special_scene.tscn")
