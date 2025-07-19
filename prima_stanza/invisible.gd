extends Area3D

@onready var invisible=$".."
#@onready var camera=$"../../../CharacterBody3D/Camera_principale"

func _on_body_entered(body):
	invisible.material.transparency=BaseMaterial3D.TRANSPARENCY_ALPHA



func _on_body_exited(body):
	invisible.material.transparency=BaseMaterial3D.TRANSPARENCY_DISABLED
	#if camera: 
		#camera.queue_free()
