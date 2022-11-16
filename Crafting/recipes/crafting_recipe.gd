extends Resource

export(Resource) var item
export(Array, Resource) var recipe

func get_item_texture():
	return item.texture

func get_recipe_textures():
	var texts = []
	for object in recipe:
		texts.append(object.texture)
	return texts