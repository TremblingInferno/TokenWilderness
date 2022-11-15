extends AnimatedSprite

var velocity:Vector2 = Vector2(0,0) setget set_velocity
export(int) var speed = 200

var vertical_movement
var horizontal_movement

export(Resource) var right
export(Resource) var left
export(Resource) var up
export(Resource) var down

func _process(delta):
	self.translate(speed * velocity.normalized() * delta)
	handle_input()

func set_velocity(val):
	velocity = val

func handle_input():
	set_velocity(Input.get_vector("left", "right", "up", "down"))

