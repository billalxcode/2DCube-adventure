extends Node2D

var paths = [
	{"name": "Black Code", "path": "res://assets/character/player.png"},
	{"name": "Blue Code", "path": "res://assets/character/blue_player.png"},
	{"name": "Red Code", "path": "res://assets/character/enemy.png"},
	{"name": "Green Code", "path": "res://assets/character/green_player.png"},
]
var data_parse

var index = 0
var saved_file = "res://assets/cfg/data01.json"

var btn_is_pressed = false
var btn_back_pressed = false
var is_change = false

func _ready():
	var file = File.new()
	file.open(saved_file, File.READ)
	data_parse = parse_json(file.get_as_text())
	
	set_physics_process(true)
	
func _physics_process(delta):
	if btn_is_pressed == false:
		if $back.pressed:
			$AnimationPlayer.play("anim_kembali")
			btn_back_pressed = true
			
	if btn_back_pressed:
		if $AnimationPlayer.is_playing() == false:
			get_tree().change_scene("res://scene/Intro.tscn")
	
	change_skin()

func change_skin():
	if Input.is_action_just_pressed("right"):
		is_change = true
		var length = paths.size() - 1
		if index == length:
			index = 0
		else:
			index += 1
		save()
	
	if Input.is_action_just_pressed("left"):
		is_change = true
		if index == 0:
			index = paths.size() - 1
		else:
			index -= 1
		save()
		
	if is_change == false:
		$PlayerAI/image.texture = load(data_parse["player"]["skins"])
	else:
		var textures = load(paths[index]["path"])
		$PlayerAI/image.texture = textures
	
func save():
	var filename = File.new()
	
	# Read save data
	filename.open(saved_file, File.READ)
	var data = parse_json(filename.get_as_text())
	
	# Insert data
	data["player"]["name"] = paths[index]["name"]
	data["player"]["skins"] = paths[index]["path"]
	
	# Rewrite data
	filename.open(saved_file, File.WRITE)
	filename.store_string(to_json(data))
	filename.close()
