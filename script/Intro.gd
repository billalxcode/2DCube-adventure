extends Node2D

var mulai = false
var keluar = false
var tutorial = false
var is_pressed = false

var rotatePower = 0

func _ready():
	$introsound.play(0)
	set_physics_process(true)
	
func _physics_process(delta):
	rotateLogo()
	var start_button = $Mulai.pressed
	var tutorial_button = $Tutorial.pressed
	var exit_button = $Exit.pressed

	if is_pressed == false:
		if start_button:
			resetAnim()
			if $clicksound.is_playing() == false:
				$clicksound.play(0)
			$anim_mulai.play("anim_mulai")
			mulai = true
			keluar = false
			tutorial = false
			is_pressed = true
			
		elif tutorial_button:
			resetAnim()
			if $clicksound.is_playing() == false:
				$clicksound.play(0)
			$anim_tutorial.play("anim_tutorial")
			tutorial = true
			mulai = false
			keluar = false
			is_pressed = true
			
		elif exit_button:
			resetAnim()
			if $clicksound.is_playing() == false:
				$clicksound.play(0)
			$anim_keluar.play("anim_keluar")
			keluar = true
			mulai = false
			tutorial = false
			is_pressed = true
	else:
		is_pressed = false
		
	if mulai and keluar == false and tutorial == false:
		if $anim_mulai.is_playing() == false:
			get_tree().change_scene("res://scene/Level.tscn")
	
	if tutorial and keluar == false and mulai == false:
		if $anim_tutorial.is_playing() == false:
			get_tree().change_scene("res://scene/Tutorial.tscn")
			
	if keluar and mulai == false and tutorial == false:
		if $anim_keluar.is_playing() == false:
			get_tree().quit()
			
func rotateLogo():
	rotatePower += 0.1 / 4
		
	$logo.rotation = rotatePower
			
func resetAnim():
	$anim_keluar.stop(true)
	$anim_mulai.stop(true)
	$anim_tutorial.stop(true)
			
			
			
			
			
