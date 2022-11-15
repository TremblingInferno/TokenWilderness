extends Sprite
class_name Item

export var item_name:String
export var spawn_width: int
export(Curve) var spawn_frequency
export(int) var max_count: int

export(NodePath) onready var area2d = get_node(area2d) as Area2D
export(Curve) var attractor_curve
export(float) var pick_up_distance = 5

func _ready():
	randomize()
	self.position.x = Random.randfn(0.25, .8) * spawn_width
	self.position.y = randi() % int(OS.get_screen_size(-1).y)

func _process(delta):
	for area in area2d.get_overlapping_areas():
		if area.is_in_group("Player"):
			attract(area, delta)

func attract(area, _delta):
	var diff = area.global_position - self.global_position
	if diff.length() < pick_up_distance:
		pick_up()
		return
	var move_vector = lerp(self.global_position, area.global_position, attractor_curve.interpolate(1/diff.length()))
	self.position = move_vector

func pick_up():
	queue_free()
	GameEvents.emit_signal("item_picked_up", self)
