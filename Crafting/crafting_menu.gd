extends Control

export(Array, Resource) var recipes
export(PackedScene) var crafting_item_gui
export(NodePath) onready var vbox = get_node(vbox)

export(NodePath) onready var inventory = get_node(inventory)

func _ready():
	instantiate_recipes()


func instantiate_recipes():
	for recipe in recipes:
		var ci = crafting_item_gui.instance()
		ci.inventory = inventory.inventory
		vbox.add_child(ci)
		ci.set_up_item(recipe)

