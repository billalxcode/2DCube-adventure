extends TileMap

func _ready():
	set_physics_process(false)
	
func delete():
	clear()
