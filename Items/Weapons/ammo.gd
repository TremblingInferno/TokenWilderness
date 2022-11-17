extends Sprite

var to_position:Vector2

var weapon_resource:Resource
var ammo_resource:Resource

func init_ammo(pos, resource):
	to_position = pos
	weapon_resource = resource
	ammo_resource = weapon_resource.ammo
	self.texture = ammo_resource.texture


func _process(delta):
	self.position = self.global_position.move_toward(to_position, delta * ammo_resource.speed)
