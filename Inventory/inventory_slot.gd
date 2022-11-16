extends CenterContainer

var full:bool = false
export(NodePath) onready var item_gui = get_node(item_gui)
var item_resource

func set_item(_item):
	item_resource = _item
	item_gui.texture = _item.inventory_texture
	full = true


func is_full():
	return full


func drop_item():
	if item_resource:
		GameEvents.emit_signal("dropped_item", item_resource)
		remove_item()


func _on_CenterContainer_gui_input(event:InputEvent):
	if event is InputEventMouse and event.is_pressed():
		drop_item()


func remove_item():
	GameEvents.emit_signal("inventory_not_full")
	full = false
	item_resource = null
	item_gui.texture = null