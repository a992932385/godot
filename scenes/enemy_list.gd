extends VBoxContainer

const  path = "res://Resources/Enemies/"

var enemies = []

func _ready() -> void:
	dir_contents()

func  dir_contents():
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while  file_name != "":
			print("Found file: " + file_name)
			
			var enemy_resource : Enemy = load(path + file_name)
			enemies.append(enemy_resource)
			
			var button = Button.new()
			button.pressed.connect(_on_pressed.bind(button))
			button.text = enemy_resource.title
			add_child(button)
			
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	print(enemies)

func _on_pressed(button : Button):
	var index = button.get_index()
	%Name.text = "Name : " + enemies[index].title
	%Health.text = "Health : " + str(enemies[index].health)
	%Damage.text = "Damage : " + str(enemies[index].damage)
	%Texture.texture = enemies[index].texture
	SoundManager.play_sfx(load("res://assets/SFX/UI/757175__henkonen__blip-1.wav"))
