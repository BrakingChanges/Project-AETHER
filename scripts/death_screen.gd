extends Panel



func _on_retry_button_pressed() -> void:
	if Globals.current_level == 1:
		get_tree().change_scene_to_file("res://scenes/Level1.tscn")
		
	if Globals.current_level == 2:
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	





func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")
