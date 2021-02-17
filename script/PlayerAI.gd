extends KinematicBody2D

var direction = 1
var gravity = 50
var move_speed = 10
var velocity = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	velocity.y += gravity
	
	if direction == 1:
		$image.flip_h = false
		velocity.x += move_speed
		var kanan = $"../kanan".is_colliding()
		if kanan:
			direction = 2
	elif direction == 2:
		$image.flip_h = true
		velocity.x -= move_speed
		var kiri = $"../kiri".is_colliding()
		if kiri:
			direction = 1
			
	velocity = move_and_slide(velocity, Vector2(0, -1))
