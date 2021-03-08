extends KinematicBody2D

var velocity = Vector2()

var gravity = 20
var move_speed = 10
var jump_force = 500
var total_coint = 2

var is_gameover = false

var save_data = "res://assets/cfg/data01.json"
var player_skills = "res://assets/cfg/data02.json"
var skins

func _ready():
	settings()
	$music.play(0)
	set_physics_process(true)
	
func _physics_process(delta):
	# Gravity
	velocity.y += gravity
	
	if is_gameover == false:
		movement()
	else:
		if $jatuh.get_playback_position() >= 3:
			$jatuh.stop()
		$CollisionShape2D.disabled = true
		if $jatuh.is_playing() == false:
			get_tree().change_scene("res://scene/Kalah.tscn")
		
	if $"../UI2/Health".current_value <= 0:
		is_gameover = true
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func movement():
	# Movement
	if Input.is_action_pressed("right"):
		$image.flip_h = false
		velocity.x += move_speed
	elif Input.is_action_pressed("left"):
		$image.flip_h = true
		velocity.x -= move_speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_force

func settings():
	# Load Data
	var file = File.new()
	file.open(save_data, File.READ)
	var data = parse_json(file.get_as_text())
	skins = data["player"]["skins"]
	
	# Change skins
	$image.texture = load(skins)
	
	file.open(player_skills, File.READ)
	var skills = parse_json(file.get_as_text())
	for index in range(skills["skills"].size()):
		if skills["skills"][index]["name"] == data["player"]["name"]:
			move_speed = skills["skills"][index]["move_speed"]
			jump_force = skills["skills"][index]["jump_force"]
			break
	