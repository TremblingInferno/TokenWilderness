extends Node2D

export(NodePath) onready var player = get_node(player)
export(NodePath) onready var spawn_point = get_node(spawn_point)

func _ready():
	player.transform.origin = spawn_point.global_transform.origin
