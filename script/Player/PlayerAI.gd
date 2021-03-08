extends KinematicBody2D

var velocity = Vector2()

var gravity = 30
var move_speed = 10

var direction = 1

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	velocity.y += gravity
	
	var kiri = $"../kiri".is_colliding()
	var kanan = $"../kanan".is_colliding()
	
	if direction == 1:
		$image.flip_h = false
		velocity.x += move_speed
		if kanan:
			direction = -1
	elif direction == -1:
		$image.flip_h = true
		velocity.x -= move_speed
		if kiri:
			direction = 1
		 
	velocity = move_and_slide(velocity, Vector2(0, -1))
