extends StaticBody2D

#  Dreamed AWAY script
@export var character:Node
@export var opacity_factor:=0.02

@onready var reflection=$Sprite2D
const  OFFSET_RIFLESSO= 21
const   FINAL_FRAME_ANIMATION=3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position
	var distance_y =character.global_position.y -global_position.y
	reflection.global_position=Vector2(character.global_position.x,global_position.y-distance_y + OFFSET_RIFLESSO)
	
	#fade
	reflection.modulate.a=1.0-distance_y*opacity_factor

	#animation
	if !character.can_move:
		return
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	if up and right:
		reflection.play("up_right")
	elif up and left:
		reflection.play("up_left")
	elif down and right:
		reflection.play("down_right")
	elif down and left:
		reflection.play("down_left")
	elif up:
		reflection.play("down")
	elif down:
		reflection.play("up")
	elif left:
		reflection.play("right")
	elif right:
		reflection.play("left")
	else:
		reflection.frame=FINAL_FRAME_ANIMATION
