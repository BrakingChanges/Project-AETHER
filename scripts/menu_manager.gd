extends TextureRect

func _ready() -> void:
	get_viewport().size = DisplayServer.screen_get_size()
	
	# Discord RPC stuff
	DiscordRPC.app_id = 1428958213721690183
	DiscordRPC.details = "A Game Jam Project by Prodo FC"
	DiscordRPC.state = "Hanging out on the main menu!"
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	
	DiscordRPC.refresh()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Settings.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
