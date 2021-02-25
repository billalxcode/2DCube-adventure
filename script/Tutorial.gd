extends Node2D

var path = "res://assets/tutorial/chap_1.png"
var count = 1

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("right"):
		count += 1
		if count >= 6 :
			get_tree().change_scene("res://scene/Intro.tscn")

	if count == 5:
		var new_texture = load("res://assets/UI/btn_back.png")
		$UI/button.set_texture(new_texture)
	
	path = "res://assets/tutorial/chap_" + str(count) + ".png"
	var image = load(path)
	$message.set_texture(image)