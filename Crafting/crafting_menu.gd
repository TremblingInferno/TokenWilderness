extends Control

export(Array, Resource) var recipes
export(PackedScene) var crafting_item
export(NodePath) onready var vbox = get_node(vbox)

func _ready():
	instantiate_recipes()


func instantiate_recipes():
	for recipe in recipes:
		var ci = crafting_item.instance()
		vbox.add_child(ci)
		ci.set_up_item(recipe)

