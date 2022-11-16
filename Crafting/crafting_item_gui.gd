extends Control

export(NodePath) onready var item_gui = get_node(item_gui)
export(NodePath) onready var recipe_gui = get_node(recipe_gui)
export(PackedScene) var recipe_item_gui

var required_items = []
var craftable_item

var inventory = []

func set_up_item(_recipe):
	craftable_item = _recipe.item
	required_items = _recipe.recipe
	item_gui.texture = _recipe.get_item_texture()
	for texture in _recipe.get_recipe_textures():
		var ri = recipe_item_gui.instance()
		ri.texture = texture
		recipe_gui.add_child(ri)


func _on_CraftingItem_gui_input(event:InputEvent):
	if event is InputEventMouse and event.is_pressed():
		craft_item()
		

func craft_item():
	if has_items():
		for item in required_items:
			GameEvents.emit_signal("item_removed", item)
		GameEvents.emit_signal("item_picked_up", craftable_item)


func has_items():
	var req_i = required_items.duplicate()
	for item in inventory:
		if req_i.has(item):
			req_i.erase(item)
	if req_i.empty():
		return true
	return false
