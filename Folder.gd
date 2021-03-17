extends "res://Object.gd"

signal photo

var IsCompl=false

func _ready():
	Emiter='Folder'
	$icon.set_animation('Folder')

func _on_Left_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("click"):
			$TurnPage.play()
			$Pages/HelpSign.hide()
			var CurFrame=$Pages.get_frame()

			if $Pages.get_frame()<4:
				$Pages/Photo.hide()

			if IsCompl==false:
				$Pages.set_frame(CurFrame-1)
			else:
				if CurFrame==3:
					$Pages.set_frame(CurFrame-2)
				else:
					$Pages.set_frame(CurFrame-1)


func _on_Right_input_event(_viewport, event, _shape_idx):
	if event.is_action_released("click"):
			$TurnPage.play()
			$Pages/HelpSign.hide()
			var CurFrame=$Pages.get_frame()
			if IsCompl==false:
				if CurFrame<2:
					$Pages.set_frame(CurFrame+1)
			else:
				if CurFrame==0:
					$Pages.set_frame(CurFrame+1)
				elif CurFrame==1:
					$Pages/HelpSign.show()
					$Pages.set_frame(3)
				elif CurFrame==3:
					$Pages/HelpSign.show()


func _on_Folder_area_entered(area):
	if area.Emiter=='Paper' and $Pages.get_frame()==2:
		$TurnPage2.play()
		$Pages/HelpSign.show()
		IsCompl=true 
		$Pages.set_frame(3)

		area.Deleter()

func _on_AreaPhoto_area_entered(area):
	if area.Emiter=='Photo' and $Pages.get_frame()==3:
			area.queue_free()
			$Pages/Photo.show()
			emit_signal("photo")
