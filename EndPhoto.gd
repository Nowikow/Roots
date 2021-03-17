extends "res://Object.gd"

var OneTime=true

signal End

func _ready():
	Emiter='none'
	$icon.set_animation('EndPhoto')

func _on_EndPhoto_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if OneTime:
				$icon.set_frame(1)
				OneTime=false
			
	if event.is_action_released("click"):
		if $icon.get_frame()==1:
			$icon.set_frame(2)
		elif $icon.get_frame()==2:
			$icon.set_frame(1)
