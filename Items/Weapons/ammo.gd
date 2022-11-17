extends Sprite

var to_position:Vector2
var from_position:Vector2
var velocity:Vector2

var weapon_resource:Resource
var ammo_resource:Resource

func init_ammo(from, to, resource):
	to_position = to
	position = from
	from_position = from
	weapon_resource = resource
	ammo_resource = weapon_resource.ammo

	velocity = ammo_resource.speed * (to_position - from_position).normalized()
	self.texture = ammo_resource.texture


func _process(delta):
	if velocity.dot(to_position - position) <= 0:
		drop_ammo()
	self.translate(velocity * delta)


func drop_ammo():
	GameEvents.emit_signal("dropped_ammo", weapon_resource, self.position)
	queue_free()
