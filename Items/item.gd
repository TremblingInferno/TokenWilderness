extends Sprite
class_name Item

var item_name:String
var inventory_texture

export(Resource) var item_resource

func _ready():
	create_from_resource()

func create_from_resource(resource = item_resource):
	item_name = resource.item_name
	self.texture = resource.texture
	inventory_texture = resource.inventory_texture
