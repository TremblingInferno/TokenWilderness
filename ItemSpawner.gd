extends Node2D

export(Array, PackedScene) var spawn_items

func _ready():
	connect("item_picked_up", GameEvents, "spawn_object")
	spawn_objects()

func spawn_objects():
	for item in spawn_items:
		item = item.instance()
		for i in item.max_count:
			spawn_object(item)

func spawn_object(object):
	var item = object.duplicate()
	add_child(item)


func _on_ItemSpawner_finished():
	pass
