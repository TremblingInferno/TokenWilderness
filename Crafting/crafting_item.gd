extends Control

export(NodePath) onready var item = get_node(item)
export(NodePath) onready var recipe = get_node(recipe)
export(PackedScene) var recipe_item

func set_up_item(recipe):
	item.texture = recipe.get_item_texture()
	for texture in recipe.get_recipe_textures():
		var ri = recipe_item.instance()
		ri.texture = texture