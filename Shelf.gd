extends Area2D

signal EndPhoto

var Emiter='none'

func _on_Shelf_area_entered(area):
	if area.Emiter=='Key':
		$UnlockKey.play()

		$Sprite.set_frame(1)
		area.queue_free()

		emit_signal("EndPhoto")
