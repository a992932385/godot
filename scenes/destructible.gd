extends Sprite2D

var frame_counter = 0
var separation : float
@onready var player_reference = get_tree().current_scene.find_child("Player")

func _physics_process(_delta):
	frame_counter += 1
	if frame_counter >= 6:
		frame_counter = 0
		frame = (frame + 1) % (hframes * vframes)
		
	separation = (player_reference.position - position).length()
	if separation < player_reference.nearest_enemy_distance:
		player_reference.nearest_enemy = self
