extends Node2D
class_name BaseLevel

func _ready():
	modulate = Color(0.8, 0.9, 1.0) # slight glow tint

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if $PauseUI.visible:
			$PauseUI.hide()
		else:
			$PauseUI.show()
