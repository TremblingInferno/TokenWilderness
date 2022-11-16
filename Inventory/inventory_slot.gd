extends CenterContainer

var full:bool = false
export(NodePath) onready var item = get_node(item)
var token_item
var qty

func set_item(_item):
	token_item = _item
	item.texture = _item.inventory_texture
	full = true


func is_full():
	return full


func drop_item():
	if token_item:
		full = false
		GameEvents.emit_signal("dropped_item", token_item)
		token_item = ''
		item.texture = null


func _on_CenterContainer_gui_input(event:InputEvent):
	if event is InputEventMouse and event.is_pressed():
		drop_item()
