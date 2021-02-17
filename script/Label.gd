extends Label

func _ready():
	set_physics_process(false)

func set_score(text):
	set_text(text)