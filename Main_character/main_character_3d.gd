extends CharacterBody3D

@onready var raycast=$ShapeCast3D
var SPEED = 3.5


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	
	if direction != Vector3.ZERO:
		$ShapeCast3D.target_position=direction 
	move_and_slide()
	
	if raycast.is_colliding():
		pass


func _input(event):
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	if up and right:
		$AnimatedSprite3D.play("up_right")
	elif up and left:
		$AnimatedSprite3D.play("up_left")
	elif down and right:
		$AnimatedSprite3D.play("down_right")
	elif down and left:
		$AnimatedSprite3D.play("down_left")
	elif up:
		$AnimatedSprite3D.play("up")
	elif down:
		$AnimatedSprite3D.play("down")
	elif left:
		$AnimatedSprite3D.play("left")
	elif right:
		$AnimatedSprite3D.play("right")
