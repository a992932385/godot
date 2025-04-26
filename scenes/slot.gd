extends PanelContainer

@export var weapon : Weapon:
	set(value):
		weapon = value
		$TextureRect.texture = value.texture
		$Coolddown.wait_time = value.cooldown
		

func _on_coolddown_timeout() -> void:
	if weapon:
		$Coolddown.wait_time = weapon.cooldown
		weapon.activate(owner, owner.nearest_enemy,get_tree())
