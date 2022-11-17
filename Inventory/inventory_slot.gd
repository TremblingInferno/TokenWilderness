extends CenterContainer

var full:bool = false
var selected:bool = false

export(NodePath) onready var item_gui = get_node(item_gui)
var item_resource


func _ready():
	GameEvents.connect("deselected_inventory", self, "un_select_object")


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
	if event is InputEventMouseButton and event.pressed:
		if selected:
			drop_item()
			return
		select_object()


func remove_item():
	GameEvents.emit_signal("inventory_not_full")
	un_select_object()
	full = false
	item_resource = null
	item_gui.texture = null


func un_select_object():
	if selected:
		selected = false
		item_gui.rect_scale = Vector2(1, 1)


func select_object():
	GameEvents.emit_signal("deselected_inventory")
	GameEvents.emit_signal("selected_item", item_resource)
	selected = true
	item_gui.rect_scale = Vector2(1.5, 1.5)