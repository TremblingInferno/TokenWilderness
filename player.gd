extends AnimatedSprite

var velocity:Vector2 = Vector2(0,0) setget set_velocity
export(int) var speed = 200

var vertical_movement
var horizontal_movement

func _process(delta):
	self.translate(speed * velocity.normalized() * delta)
	handle_input()

func set_velocity(val):
	velocity = val

func handle_input():
	if Input.is_action_just_pressed("up") or Input.is_action_just_released("down"):
		vertical_movement = -1
	if Input.is_action_just_pressed("down") or Input.is_action_just_released("up"):
		vertical_movement = 1
	if Input.is_action_just_pressed("right") or Input.is_action_just_released("left"):
		horizontal_movement = 1
	if Input.is_action_just_pressed("left") or Input.is_action_just_released("right"):
		horizontal_movement = -1
	
	if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		velocity.y = vertical_movement
	else:
		velocity.y = 0
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		velocity.x = horizontal_movement
	else:
		velocity.x = 0
	
	

