extends KinematicBody2D

var velocity = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2(0, -1))
	check_colliding()
	
func check_colliding():
	for idx in get_slide_count():
		var collision = get_slide_collision(idx)
		
		if collision != null:
			if collision.collider.name == "Player":
				$"../Player".velocity.y -= 250
				$"../UI2/Health".damanged()