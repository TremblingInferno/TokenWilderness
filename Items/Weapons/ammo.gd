extends Sprite

var to_position:Vector2
var from_position:Vector2

var weapon_resource:Resource
var ammo_resource:Resource

func init_ammo(from, to, resource):
	to_position = to
	position = from
	from_position = from
	weapon_resource = resource
	ammo_resource = weapon_resource.ammo
	self.texture = ammo_resource.texture

var change = 0

func _process(delta):
	if change >= 1:
		drop_ammo()
	change += ammo_resource.speed * delta
	self.position = lerp(from_position, to_position, change)


func drop_ammo():
	GameEvents.emit_signal("dropped_ammo", weapon_resource, self.position)
	queue_free()