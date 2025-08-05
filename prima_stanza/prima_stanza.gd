extends Node2D

@onready var fade_in:AnimationPlayer=$prima_stanza/Fade_in/fade_in

func _on_audio_stream_player_finished():
	await  get_tree().create_timer(3,false).timeout
	fade_in.play("fade_in")
