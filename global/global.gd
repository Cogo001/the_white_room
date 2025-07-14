extends Node

var fullscreen=false

func _input(event):
	if  event.is_action_pressed("full_screen") and fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		fullscreen=false
	elif event.is_action_pressed("full_screen") and !fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen=true
