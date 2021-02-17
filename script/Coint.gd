extends KinematicBody2D

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	$CoinImage.play()

func delete():
	queue_free()
