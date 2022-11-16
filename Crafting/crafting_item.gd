extends Control

export(NodePath) onready var item = get_node(item)
export(NodePath) onready var recipe = get_node(recipe)
export(PackedScene) var recipe_item

func set_up_item(_recipe):
	item.texture = _recipe.get_item_texture()
	for texture in _recipe.get_recipe_textures():
		var ri = recipe_item.instance()
		ri.texture = texture
		recipe.add_child(ri)