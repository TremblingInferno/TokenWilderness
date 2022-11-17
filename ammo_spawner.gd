extends Node2D

export(PackedScene) var ammo_object
export(NodePath) onready var player = get_node(player)

func _ready():
	GameEvents.connect("thrown_ammo", self, "shoot_ammo")


func shoot_ammo(item_resource):
	var ammo = ammo_object.instance()
	ammo.init_ammo(player.position, get_global_mouse_position(), item_resource)
	add_child(ammo)