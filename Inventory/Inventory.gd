extends HBoxContainer

export(String) onready var inventory_slot = load(inventory_slot) as PackedScene
export var max_items = 4

var item_number = 0

func _ready():
	GameEvents.connect("item_picked_up", self, "add_item_slot")
	GameEvents.connect("dropped_item", self, "remove_item")
	create_empty_inventory()


func create_empty_inventory():
	for i in max_items:
		var inv = inventory_slot.instance()
		add_child(inv)
		

func add_item_slot(item):
	var slot = get_next_open_slot()
	if slot:
		item_number += 1
		slot.set_item(item)
		if self.is_full():
			GameEvents.emit_signal("inventory_full")

func get_next_open_slot():
	for slot in get_children():
		if not slot.is_full():
			return slot

func is_full():
	if item_number >= max_items:
		return true
	return false

func remove_item(_item):
	if _item:
		item_number -= 1