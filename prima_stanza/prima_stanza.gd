extends Node2D

@onready var fade_in:AnimationPlayer=$prima_stanza/Fade_in/fade_in
@onready var dialogue_rubinetto=$prima_stanza/StaticBody2D/DialogueArea2D
func _on_audio_stream_player_finished():
	await  get_tree().create_timer(3,false).timeout
	fade_in.play("fade_in")


#test 
func rubinetto_aperto():
	dialogue_rubinetto.dialogue[2].text="non si muove"

func rubinetto_chiuso():
	dialogue_rubinetto.dialogue[2].text="lasciamo stare "
	
