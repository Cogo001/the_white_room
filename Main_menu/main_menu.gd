extends Control

var finished_animation:bool=false
@onready var  start_focus:Button=$VBoxContainer/Start
@onready var fade_out:AnimationPlayer=$Fade_out/Fade_out_animation
func _ready():
	start_focus.grab_focus()
func _on_start_pressed():
	
	if finished_animation:
		fade_out.play("fade_out")


func _on_continua_pressed():
	if finished_animation:
		print("continua")


func _on_impostazioni_pressed():
	if finished_animation:
		print("impostazioni")


func _on_esci_pressed():
	if finished_animation:
		get_tree().quit()


func _on_animation_player_animation_finished(anim_name):
	finished_animation=true





func _on_fade_out_animation_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://prima_stanza/prima_stanza.tscn")
