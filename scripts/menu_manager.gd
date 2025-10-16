extends TextureRect

func _ready() -> void:
	get_viewport().size = DisplayServer.screen_get_size()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/LevelSelect.tscn")

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Settings.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
