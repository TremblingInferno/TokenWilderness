extends Resource

export(PackedScene) var item
export(Array, PackedScene) var recipe

func get_item_texture():
	return item.texture

func get_recipe_textures():
	var texts = []
	for object in recipe:
		texts.append(object.recipe)
	return texts