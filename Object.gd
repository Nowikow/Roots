extends Area2D

var Emiter='None'

var dragMouse=false
var CanDrag=true
var PointPosition

signal Druger
signal NoneDruger

func Stoper():
	dragMouse=false
	emit_signal("NoneDruger")

func _on_Object_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed() and CanDrag:
			PointPosition=get_viewport().get_mouse_position()
			dragMouse=true
			z_index=3

			if $icon.get_animation()=='Key':
				z_index=5

			emit_signal("Druger")
		else:
			dragMouse=false
			emit_signal("NoneDruger")
