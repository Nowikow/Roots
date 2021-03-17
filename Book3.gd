extends "res://Object.gd"

func _on_Book3_input_event(viewport, event, shape_idx):
	if event.is_action_released("click"):
		emit_signal("click")
