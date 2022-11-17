extends Sprite

var item setget set_item
export(PackedScene) var ammo

func _ready():
	GameEvents.connect("selected_item", self, "set_item")
	GameEvents.connect("deselected_inventory", self, "deselect_item")


func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		throw_weapon()


func attack():
	var am = ammo.instance()
	am.init_ammo(get_global_mouse_position(), item)
	add_child(am)
	GameEvents.emit_signal("item_removed", item)


func set_item(val):
	item = val
	if val:
		self.texture = val.inventory_texture
	else: 
		deselect_item()


func deselect_item():
		self.texture = null


func throw_weapon():
	if item is WeaponResource:
		attack()
