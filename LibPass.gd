extends "res://Object.gd"

func _ready():
	Emiter='none'
	$icon.set_animation('LibraryPass')

func _on_LibraryPass_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("click"):
		if $icon.get_frame()==0:
			$Phone.show()
			$icon.set_frame(1)
		else:
			$Phone.hide()
			$icon.set_frame(0)
