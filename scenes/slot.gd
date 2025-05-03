extends PanelContainer

@export var item : Weapon:
	set(value):
		if item != null and item.has_method("reset"):
			item.reset()
			
		item = value
		$TextureRect.texture = value.icon
		$Coolddown.wait_time = value.cooldown
		item.slot = self
		
func _physics_process(delta):
	if item != null and item.has_method("update"):
		item.update(delta)


func _on_coolddown_timeout():
	if item:
		$Coolddown.wait_time = item.cooldown
		item.activate(owner, owner.nearest_enemy,get_tree())
