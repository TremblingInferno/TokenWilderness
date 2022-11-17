extends Sprite

var item setget set_item

func _ready():
	GameEvents.connect("selected_item", self, "set_item")
	GameEvents.connect("deselected_inventory", self, "deselect_item")


func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		throw_weapon()


func attack():
	GameEvents.emit_signal("item_removed", item)
	GameEvents.emit_signal("thrown_ammo", item)


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
