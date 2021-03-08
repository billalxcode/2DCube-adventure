extends Node2D

var save_data = "res://assets/cfg/data01.json"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var score = $UI/Score.score
	var raycast = $garisbawah.is_colliding()
	if raycast:
		print ("waduh")
		
	if score == 14:
		saveLevel()
		get_tree().change_scene("res://scene/Level/Level4.tscn")

func saveLevel():
	# Call class File
	var file = File.new()
	
	# Read save data
	file.open(save_data, File.READ)
	var data = parse_json(file.get_as_text())
	data["checkpoint"] = "Level4.tscn"
	
	# Rewrite save data
	file.open(save_data, File.WRITE)
	file.store_string(to_json(data))
	file.close()

