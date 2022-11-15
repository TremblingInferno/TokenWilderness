extends Sprite
class_name Item

export var item_name:String
export(Texture) var inventory_texture

export var spawn_width: int = 2000
export(int) var max_count: int = 10

export(NodePath) onready var area2d = get_node(area2d) as Area2D
export(Curve) var attractor_curve
export(float) var pick_up_distance = 5

func _ready():
	randomize_position()

func randomize_position():
	self.position.x = Random.randfn(0.5, .25) * spawn_width + 300
	self.position.y = randi() % 500 + 100

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
	get_parent().remove_child(self)
	GameEvents.emit_signal("item_picked_up", self)

