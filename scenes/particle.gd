extends GPUParticles2D

func _ready() -> void:
	emitting = true
	one_shot = true
	
func _physics_process(_delta) -> void:
	if emitting == false:
		queue_free()
