extends Label

func _process(_delta) -> void:
	text = "Gold : " + str(SaveData.gold)
