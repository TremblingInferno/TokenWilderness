extends Node2D

export(Array, PackedScene) var spawn_items
export(NodePath) onready var player = get_node(player)

func _ready():
	GameEvents.connect("item_removed", self, "respawn_object")
	GameEvents.connect("dropped_item", self, "drop_item")
	spawn_objects()


func spawn_objects():
	for item in spawn_items:
		item = item.instance()
		for i in item.max_count:
			spawn_object(item)


func spawn_object(object):
	var item = object.duplicate()
	add_child(item)


func drop_item(item):
	item.position = player.position + Random2D.point_in_circle(80, 100)
	add_child(item)


func respawn_object(object):
	object.randomize_position()
	add_child(object)
	

func _on_ItemSpawner_finished():
	pass
