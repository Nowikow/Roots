extends "res://ObjectTable.gd"

signal bowl

func _on_Bowl_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("click"):
		emit_signal("bowl")
