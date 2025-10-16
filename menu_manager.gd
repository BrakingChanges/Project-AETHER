extends TextureRect



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
	

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Settings.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
