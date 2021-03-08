extends ProgressBar

var max_values = 100
var current_value = max_values

func _ready():
	max_value = max_values
	
func _physics_process(delta):
	value = current_value
	
func damanged():
	current_value -= 15