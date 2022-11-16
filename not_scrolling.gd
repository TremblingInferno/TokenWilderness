extends Node2D

export(NodePath) onready var player = get_node(player)
export(int) var offset

func _process(delta):
	self.position.x = player.position.x + offset
