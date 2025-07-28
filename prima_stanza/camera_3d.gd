extends Camera3D
	
func _process(delta):
	var pos = global_transform.origin
	pos.x = clamp(pos.x, -1, 1)

	global_transform.origin = pos
