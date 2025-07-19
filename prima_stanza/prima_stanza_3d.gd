extends Node3D


@onready var fade_in:AnimationPlayer=$Fade_in/fade_in


func _on_bip_bip_hospital_finished():
	await  get_tree().create_timer(3,false).timeout
	fade_in.play("fade_in")
