extends Node2D

func _ready():
	$Player/Camera2D/Timer.total_time = 40
	set_physics_process(true)
	
func _physics_process(delta):
	if $Player.score >= 60:
		$pintu.clear()
		
	if $Player.score >= 100:
		get_tree().change_scene("res://scene/Level7.tscn")
	
	var raycast = $RayCast2D.is_colliding()
	var gameover = $gameover.is_colliding()
	if raycast:
		$Player/gameOverSFX.play(0)
		$Player.gameover = true
		
	if gameover or $Player/Camera2D/Timer.check():
		get_tree().change_scene("res://scene/Kalah.tscn")
