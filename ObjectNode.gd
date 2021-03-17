extends Node2D

func _process(_delta):
	for obj in get_children():
		if obj.dragMouse:
			obj.set_position(get_viewport().get_mouse_position())

func _on_Object_Druger():
	for obj in get_children():
		if obj.dragMouse==false:
			obj.z_index=2
			obj.CanDrag=false

func _on_Object_NoneDruger():
	for obj in get_children():
		obj.CanDrag=true
