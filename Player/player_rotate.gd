extends Node2D


export(NodePath) onready var held_item = get_node(held_item)
var item setget set_item


func _ready():
	GameEvents.connect("selected_item", self, "set_item")


func _input(event):
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())


func set_item(val):
	item = val
	if val:
		held_item.texture = val.inventory_texture
	else:
		held_item.texture = null
