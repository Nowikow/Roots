extends "res://Object.gd"

func _ready():
	Emiter='Key'

func _on_Key_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			$icon.set_frame(1)
