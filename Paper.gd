extends "res://Object.gd"

func _ready():
	Emiter='Paper'
	$icon.set_animation('Paper')

func Deleter():
	queue_free()
