extends "res://Object.gd"

signal click

func _ready():
	Emiter='none'

func _on_Book2_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("click"):
		emit_signal("click")
