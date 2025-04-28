extends PanelContainer

@export var item : Weapon:
	set(value):
		item = value
		$TextureRect.texture = value.texture
		$Coolddown.wait_time = value.cooldown
		item.slot = self
		

func _on_coolddown_timeout():
	if item:
		$Coolddown.wait_time = item.cooldown
		item.activate(owner, owner.nearest_enemy,get_tree())
