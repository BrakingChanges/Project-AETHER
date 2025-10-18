extends PathFollow2D

@export var speed: float = 100.0
@export var loops: bool = true
@export var path: Path2D

var direction := 1

func _process(delta):
	# Move along the path
	if $Timer.is_stopped():
		progress += speed * direction * delta
	# Reverse when reaching the ends
	if not loops:
		if progress_ratio >= 1.0:
			progress_ratio = 1.0
			direction = -1
		elif progress_ratio <= 0.0:
			progress_ratio = 0.0
			direction = 1
	else:
		progress = wrapf(progress, 0, path.curve.get_baked_length())
