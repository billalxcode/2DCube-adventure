extends Node2D

func _ready():
	$Player/Camera2D/Timer.total_time = 35
	set_physics_process(true)
	
func _physics_process(delta):
	print ($Player.score)
	if $Player.score == 40:
		print ("Score")
		$pintu.delete()
	
	if $Player.score == 90:
		$pintu2.delete()
		
	if $Player.score >= 100:
		get_tree().change_scene("res://scene/Level6.tscn")
		
	var raycast = $RayCast2D.is_colliding()
	var raycast2 = $RayCast2D2.is_colliding()
	var gameover = $gameover.is_colliding()
	if raycast or raycast2:
		$Player/gameOverSFX.play(0)
		$Player.gameover = true
		
	if gameover or $Player/Camera2D/Timer.check():
		get_tree().change_scene("res://scene/Kalah.tscn")
