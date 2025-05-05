extends Control

func _ready() -> void:
	menu()

func _on_upgrades_pressed() -> void:
	skill_tree()


func _on_beastiary_pressed() -> void:
	beastiary()

func menu():
	$Menu.show()
	$SkillTree.hide()
	$Beastiary.hide()
	$Gold.hide()
	$Back.hide()
	tween_pop($Menu)

func skill_tree():
	$SkillTree.show()
	$Gold.show()
	$Menu.hide()	
	$Back.show()
	tween_pop($SkillTree)
	
func beastiary():
	$Beastiary.show()
	$Menu.hide()
	$Gold.hide()
	$Back.show()
	tween_pop($Beastiary)


func _on_back_pressed() -> void:
	menu()
	
	
func  tween_pop(panel):
	SoundManager.play_sfx(load("res://assets/SFX/UI/BGM04town0.wav"))
	panel.scale = Vector2(0.85,0.85)
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(panel, "scale", Vector2(1,1), 0.5)
