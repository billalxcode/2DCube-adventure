extends KinematicBody2D

onready var Score = preload("res://script/Objects/Score.gd")

var velocity = Vector2.ZERO
var score = 0

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2(0, -1))	
	for idx in get_slide_count():
		var coll = get_slide_collision(idx)
		if coll.collider.name == "Player":
			score = score + 2
			if queue_free() == null: pass
		$"../UI/Score".set_score()
		$"../Player/collect".play(0)