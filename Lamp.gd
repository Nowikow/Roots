extends "res://ObjectTable.gd"

var IsSwitch=false

func _ready():
	$Sprite.set_animation('Lamp')

func _on_LightButton_pressed():
	$ButtonLayer/LightButton/LampSound.play()
	IsSwitch=not(IsSwitch)

	if IsSwitch:
		$Light.show()
	else:
		$Light.hide()
