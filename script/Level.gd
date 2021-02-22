extends Node2D

var Bullet = preload("res://scene/Bullet.tscn")

func _ready():
	$Player/Camera2D/Timer.total_time = 15
	set_physics_process(true)
	
func _physics_process(delta):
	if $Player.score >= 100:
		get_tree().change_scene("res://scene/Level2.tscn")
	
	var raycast = $RayCast2D.is_colliding()
	var raycast2 = $RayCast2D2.is_colliding()
	if raycast:
		$Player/gameOverSFX.play(0)
		$Player.gameover = true
		
	if raycast2 or $Player/Camera2D/Timer.check():
		get_tree().change_scene("res://scene/Kalah.tscn")

func spawnBullet():
	var bullet = Bullet.instance()
	bullet.global_position = Vector2(1024, 482.611)
	add_child(bullet)

func _on_Timer_timeout():
	# spawnBullet()
	pass
