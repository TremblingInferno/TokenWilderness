extends Node2D

export(NodePath) onready var player = get_node(player)

func _process(delta):
	self.position.x = player.position.x

