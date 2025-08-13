extends ColorRect
class_name lighting

# Called when the node enters the scene tree for the first time.
func _ready():
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var light_position=get_light_position()
	material.set_shader_parameter("number_of_lights",light_position.size())
	material.set_shader_parameter("lights",light_position)



func get_light_position():
	return get_tree().get_nodes_in_group("light").map(
		func(light:Node2D):
			return light.get_global_transform_with_canvas().origin
	)
