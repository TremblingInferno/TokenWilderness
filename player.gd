extends AnimatedSprite

var velocity:Vector2 = Vector2(0,0)
export(int) var speed = 200

func _process(delta):
	self.translate(speed * velocity.normalized() * delta)

func _unhandled_key_input(event):
	if event.is_action("up"):
		up()
	if event.is_action("down"):
		down()
	if event.is_action("right"):
		right()
	if event.is_action("left"):
		left()

func up():
	velocity.y = -1
func down():
	velocity.y = 1
func right():
	velocity.x = 1
func left():
	velocity.x = -1