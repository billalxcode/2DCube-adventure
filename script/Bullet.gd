extends KinematicBody2D

var speed = 50

var velocity = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	position.x -= speed
