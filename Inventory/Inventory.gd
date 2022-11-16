extends HBoxContainer

export(String) onready var inventory_slot = load(inventory_slot) as PackedScene
export var max_items = 4

var inventory:Array = []

func _ready():
	GameEvents.connect("item_picked_up", self, "add_item_slot")
	create_empty_inventory()


func create_empty_inventory():
	for i in max_items:
		var inv = inventory_slot.instance()
		add_child(inv)
		

func add_item_slot(item):
	var slot = get_next_open_slot()
	if slot:
		slot.set_item(item)

func get_next_open_slot():
	var slots = get_children()
	for i in max_items:
		if i == max_items-1:
			GameEvents.emit_signal("inventory_full")
		if !slots[i].is_full():
			return slots[i]
	return 0