extends Node2D

export(PackedScene) var pickupable_item
export(Array, Resource) var spawn_items
export(NodePath) onready var player = get_node(player)

export(int) var max_count: int = 10

func _ready():
	GameEvents.connect("item_removed", self, "respawn_object")
	GameEvents.connect("dropped_item", self, "drop_item")
	GameEvents.connect("dropped_ammo", self, "drop_ammo")
	spawn_objects()


func spawn_objects():
	for item_resource in spawn_items:
		for i in max_count:
			spawn_object(item_resource)


func respawn_object(item_resource):
	if item_resource is SpawnableItemResource:
		spawn_object(item_resource)

func spawn_object(item_resource):
	var item = pickupable_item.instance()
	item.item_resource = item_resource
	add_child(item)
	return item


func drop_item(item_resource):
	var item = spawn_object(item_resource)
	item.position = player.position + Random2D.point_in_circle(80, 100)


func drop_ammo(item_resource, pos):
	var item = spawn_object(item_resource)
	item.position = pos + Random2D.point_in_circle(10, 50)