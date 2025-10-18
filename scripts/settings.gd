extends Panel

var config = ConfigFile.new()

@onready var fullscreen: CheckBox = $MarginContainer/TabContainer/Graphics/CenterContainer/VBoxContainer/HFlowContainer/FullScreen
@onready var master_volume: HSlider = $MarginContainer/TabContainer/Audio/CenterContainer/VBoxContainer/HFlowContainer/MarginContainer/MasterVolumeSlider
@onready var sfx_volume: HSlider = $MarginContainer/TabContainer/Audio/CenterContainer/VBoxContainer/HFlowContainer2/MarginContainer/SFXVolumeSlider
@onready var music_volume: HSlider =$MarginContainer/TabContainer/Audio/CenterContainer/VBoxContainer/HFlowContainer3/MarginContainer/MusicVolumeSlider

var err = config.load("user://settings.cfg")

func _ready() -> void:
	if err != OK:
		# Set default settings
		fullscreen.toggle_mode = false
		master_volume.value = 1
		sfx_volume.value = 1
		music_volume.value = 1
	else:
		fullscreen.toggle_mode = config.get_value("Settings", "fullscreen", false)
		master_volume.value = config.get_value("Settings", "master_volume", 1)
		sfx_volume.value = config.get_value("Settings", "sfx_volume", 1)
		music_volume.value = config.gset_value("Settings", "music_volume", 1)



func _on_apply_changes_button_pressed() -> void:
	config.set_value("Settings", "fullscreen", fullscreen.toggle_mode)
	config.set_value("Settings", "master_volume", master_volume.value)
	config.set_value("Settings", "sfx_volume", sfx_volume.value)
	config.set_value("Settings", "music_volume", music_volume.value)
	config.save("user://settings.cfg")
	get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")

func _on_discard_changes_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")

func _on_master_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)
	

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)

func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)


func _on_full_screen_toggled(toggled_on: bool) -> void:
	print("toggled")
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
