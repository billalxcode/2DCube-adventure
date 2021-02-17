extends Node2D

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if $Player.score >= 100:
		get_tree().change_scene("res://scene/Level2.tscn")
	
	var raycast = $RayCast2D.is_colliding()
	if raycast:
		get_tree().change_scene("res://scene/Kalah.tscn")
