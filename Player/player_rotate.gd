extends Node2D

func _input(event):
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())

