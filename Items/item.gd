extends Sprite
class_name Item

export var item_name:String
export(NodePath) onready var area2d = get_node(area2d) as Area2D
export(Curve) var attractor_curve

func _process(delta):
	for area in area2d.get_overlapping_areas():
		if area.is_in_group("Player"):
			attract(area, delta)

func attract(area, _delta):
	var diff = area.global_position - self.global_position
	if diff.length() < 0.1:
		pick_up()
		return
	var move_vector = lerp(self.global_position, area.global_position, attractor_curve.interpolate(1/diff.length()))
	self.position = move_vector

func pick_up():
	queue_free()
	GameEvents.emit_signal("item_picked_up", self)