extends Sprite2D
var frame_counter = 0

func _physics_process(_delta):
	frame_counter += 1
	if frame_counter >= 11:
		frame_counter = 0
		frame = (frame + 1) % (hframes * vframes)
