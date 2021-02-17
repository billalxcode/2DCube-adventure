extends Node2D

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if $Player.score >= 100:
		get_tree().change_scene("res://scene/Level5.tscn")
		
	var raycast = $RayCast2D.is_colliding()
	var raycast2 = $RayCast2D2.is_colliding()
	if raycast or raycast2:
		get_tree().change_scene("res://scene/Kalah.tscn")
