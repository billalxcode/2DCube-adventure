extends Node2D

var total_time = 10
var count = 0

func _ready():
	$Timer.wait_time = 1
	$Timer.start()
	set_physics_process(true)
	
func _physics_process(delta):
	$Label.text = "Timer:" + str(total_time) + ""
	
func check():
	if total_time <= 0:
		return true
	else:
		return false
		
func _on_Timer_timeout():
	total_time -= 1
