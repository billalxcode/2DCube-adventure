extends Node2D

var mulai = false
var keluar = false
var rotatePower = 0

func _ready():
	$introsound.play(0)
	set_physics_process(true)
	
func _physics_process(delta):
	rotateLogo()
	var start_button = $Mulai.pressed
	var exit_button = $Exit.pressed
	
	if start_button:
		$clicksound.play(0)
		$AnimationPlayer.play("mulai")
		mulai = true
		keluar = false
		
	elif exit_button:
		$clicksound.play(0)
		$AnimationPlayer.play("keluar")
		keluar = true
		mulai = false
		
	if mulai and keluar == false:
		if $AnimationPlayer.is_playing() == false:
			get_tree().change_scene("res://scene/Level.tscn")
	
	if keluar and mulai == false:
		if $AnimationPlayer.is_playing() == false:
			get_tree().quit()
			
func rotateLogo():
	rotatePower += 0.1 / 4
		
	$logo.rotation = rotatePower
			
			
			
			
			
			
			
