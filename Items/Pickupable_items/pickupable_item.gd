extends Item

export var spawn_width: int = 2000

export(NodePath) onready var area2d = get_node(area2d) as Area2D
export(Curve) var attractor_curve
export(float) var pick_up_distance = 5

var inventory_full := false

func _ready():
	GameEvents.connect("inventory_not_full", self, "start_collection")
	GameEvents.connect("inventory_full", self, "stop_collection")
	randomize_position()


func randomize_position():
	self.position.x = Random.randfn(0.5, .25) * spawn_width + 300
	self.position.y = randi() % 500 + 100


func _process(delta):
	if inventory_full:
		return
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
	GameEvents.emit_signal("item_picked_up", item_resource)


func stop_collection():
	inventory_full = true


func start_collection():
	inventory_full = false
