extends KinematicBody2D

var run_speed = 30
var jump_power = 50
var gravity = 10
var score = 0

var velocity = Vector2()

var is_jump = false
var is_coll_coin = false
var gameover = false

func _ready():
	score = 0
	set_physics_process(true)
	
func _physics_process(delta):
	velocity.y += gravity
	
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_pressed("jump")
	
	if gameover == false:
		if right:
			velocity.x += run_speed
			$Sprite.flip_h = false
		
		if left:
			velocity.x -= run_speed
			$Sprite.flip_h = true
			
		if jump:
			jump_process()
			
		if is_jump and is_on_floor():
			is_jump = false

	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	check_point()
		
func jump_process():
	if gameover == false:
		velocity.y -= jump_power
		is_jump = true
	
func check_point():
	for idx in get_slide_count():
		var slide_collider = get_slide_collision(idx)
		if is_coll_coin == false:
			if slide_collider.collider.name == "Coint":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint2":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint2".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint3":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint3".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint4":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint4".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint5":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint5".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint6":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint6".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint7":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint7".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint8":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint8".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint9":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint9".delete()
				score = score + 10
			elif slide_collider.collider.name == "Coint10":
				$collect.play(0)
				is_coll_coin = true
				$"../Coint10".delete()
				score = score + 10
			else:
				is_coll_coin = false
	is_coll_coin = false
	
	$"../Player/Camera2D/Label".set_score("Score:" + str(score))
	
func get_position():
	return position
