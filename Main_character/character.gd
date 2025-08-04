extends CharacterBody2D

@onready var animation_sprite:AnimatedSprite2D=$Sprite2D
const   FINAL_FRAME_ANIMATION=3
const SPEED = 150
#const JUMP_VELOCITY = -400.0
var can_move:bool=true  #dialogue
func _ready():
	add_to_group("player")
	animation_sprite.frame=FINAL_FRAME_ANIMATION


func _physics_process(delta):
	if !can_move:
		return #annulla quallo che ce sotto
		
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _input(event):
	if !can_move:
		return #annulla quallo che ce sotto
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	if up and right:
		animation_sprite.play("up_right")
	elif up and left:
		animation_sprite.play("up_left")
	elif down and right:
		animation_sprite.play("down_right")
	elif down and left:
		animation_sprite.play("down_left")
	elif up:
		animation_sprite.play("up")
	elif down:
		animation_sprite.play("down")
	elif left:
		animation_sprite.play("left")
	elif right:
		animation_sprite.play("right")
	else:
		animation_sprite.frame=FINAL_FRAME_ANIMATION
