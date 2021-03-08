extends Node2D

var mulai_pressed = false
var tutorial_pressed = false
var skins_pressed = false
var keluar_pressed = false
var is_pressed = false

var save_data = "res://assets/cfg/data01.json"

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	$AnimationBanner.play("anim_banner")
	
	if is_pressed == false:
		if $Mulai.pressed:
			$click.play(0)
			is_pressed = true
			mulai_pressed = true
			tutorial_pressed = false
			skins_pressed = false
			keluar_pressed = false
			$Animation.play("anim_mulai")
			
		elif $Tutorial.pressed:
			$click.play(0)
			is_pressed = true
			mulai_pressed = false
			tutorial_pressed = true
			skins_pressed = false
			keluar_pressed = false
			$Animation.play("anim_tutorial")
			
		elif $Skins.pressed:
			$click.play(0)
			is_pressed = true
			mulai_pressed = false
			tutorial_pressed = false
			skins_pressed = true
			keluar_pressed = false
			$Animation.play("anim_skins")
			
		elif $Keluar.pressed:
			$click.play(0)
			is_pressed = true
			mulai_pressed = false
			tutorial_pressed = false
			skins_pressed = false
			keluar_pressed = true
			$Animation.play("anim_keluar")
	
	if mulai_pressed == true and tutorial_pressed == false and skins_pressed == false and keluar_pressed == false:
		if $Animation.is_playing() == false:
			var last_level = check_last_level()
			get_tree().change_scene(last_level)
			
	if mulai_pressed == false and tutorial_pressed == true and skins_pressed == false and keluar_pressed == false:
		if $Animation.is_playing() == false:
			get_tree().quit()
			
	if mulai_pressed == false and tutorial_pressed == false and skins_pressed == true and keluar_pressed == false:
		if $Animation.is_playing() == false:
			get_tree().change_scene("res://scene/Skins.tscn")
			
	if mulai_pressed == false and tutorial_pressed == false and skins_pressed == false and keluar_pressed == true:
		if $Animation.is_playing() == false:
			get_tree().quit()
			
func check_last_level():
	var file = File.new()
	file.open(save_data, File.READ)
	var data = file.get_as_text()
	file.close()
	return "res://scene/Level/" + parse_json(data)["checkpoint"]
