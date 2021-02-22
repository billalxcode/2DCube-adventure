extends Node2D

func _ready():
	set_physics_process(false)

func _on_Timer_timeout():
	get_tree().change_scene("res://scene/Intro.tscn")