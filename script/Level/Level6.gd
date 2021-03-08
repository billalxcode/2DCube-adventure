extends Node2D

var save_data = "res://assets/cfg/data01.json"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var score = $UI/Score.score
	var raycast = $garisbawah.is_colliding()
	var raycast2 = $garisbawah2.is_colliding()
	if raycast or raycast2:
		$Player/jatuh.play(0)
		if $Player.is_gameover == false:
			$Player.is_gameover = true
		
	if score == 14:
		saveLevel()
		get_tree().change_scene("res://scene/Menang.tscn")

func saveLevel():
	# Call class File
	var file = File.new()
	
	# Read save data
	file.open(save_data, File.READ)
	var data = parse_json(file.get_as_text())
	data["checkpoint"] = "Level6.tscn"
	
	# Rewrite save data
	file.open(save_data, File.WRITE)
	file.store_string(to_json(data))
	file.close()

