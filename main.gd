extends Node2D

export(String) onready var player = load(player) as PackedScene
export(NodePath) onready var spawn_point = get_node(spawn_point)

func _ready():
	var _player = player.instance()
	_player.transform.origin = spawn_point.global_transform.origin
	add_child(_player)
