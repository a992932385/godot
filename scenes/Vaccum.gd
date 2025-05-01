extends Pickups
class_name PickupMagent

func activate():
	super.activate()
	player_reference.get_tree().call_group("Pickups","follow",player_reference,true)
