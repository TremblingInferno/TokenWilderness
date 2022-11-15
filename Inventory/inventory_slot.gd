extends CenterContainer

var full:bool = false
export(NodePath) onready var item = get_node(item)
var qty

func set_item(_item):
	item.texture = _item.inventory_texture
	full = true


func is_full():
	return full