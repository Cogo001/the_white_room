extends AnimatedSprite2D

var near_door=false
@onready var nuova_posizione=$"../../seconda_stanza/Marker2D"
@onready var character=$"../../CharacterBody2D"
@onready var camera=$"../../Camera2D"
func  _input(event):
	if near_door and event.is_action_pressed("ui_accept"):
		$".".play("default")
		await  get_tree().create_timer(2).timeout
		character.global_position=nuova_posizione.global_position
		camera.global_position=nuova_posizione.global_position
		


func _on_area_2d_body_entered(body):
	near_door=true


func _on_area_2d_body_exited(body):
	near_door=false
