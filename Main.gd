extends Node2D

var OneTimeFader=true
var OneTimeRing=true
var OneTimePhoto=true

var Number1=false
var Number2=false
var Number3=false
var IsRing=1

var IsPhoto=false
var IsFade=false
var IsKey=false

func _ready():
	$Fader.seek(0)
	$Fader.play("In")

func _process(_delta):
	if IsRing==4 and OneTimeRing:
		if Number1 and Number2 and Number3:
			$SoundNode/PhoneSounds/PreCall.play()
			OneTimeRing=false
		else:
			$SoundNode/PhoneSounds/Beep.play()
			IsRing=1
			Number1=false
			Number2=false
			Number3=false

func _on_LightArea_area_entered(area):
	if area.Emiter=='Folder' and area.get_node('Pages').get_frame()==3 and $TableThingsNode/Lamp.IsSwitch and IsFade:
		if OneTimeFader:
			$ObjectNode/Folder/Pages/HelpSign/FadeIn.play("In")

func _on_LightArea_area_exited(area):
	if area.Emiter=='Folder' and area.get_node('Pages').get_frame()==3:
		if OneTimeFader:
			$ObjectNode/Folder/Pages/HelpSign/FadeIn.stop()

func _on_FadeIn_animation_finished(_anim_name):
	OneTimeFader=false
	IsKey=true

func _on_Book1_click():
	if IsPhoto:
		if $ObjectNode/Book1/icon.get_animation()=='Book1':
			$ObjectNode/Book1/icon.set_animation('OpenBook')
		else:
			$ObjectNode/Book1/icon.set_animation('Book1')

func _on_Book2_click():
	if IsPhoto:
		if $ObjectNode/Book2/icon.get_animation()=='Book2':
			$ObjectNode/Book2/icon.set_animation('OpenBook')

			if OneTimePhoto:
				$SoundNode/PhotoDrop.play()
				$ObjectNode/Photo.set_position($ObjectNode/Book2.position)
				$ObjectNode/Photo.z_index=3
				$ObjectNode/Photo.show()
				OneTimePhoto=false
		else:

			$ObjectNode/Book2/icon.set_animation('Book2') 

func _on_6_pressed():
	$SoundNode/PhoneButton.play()
	if IsRing==1:
		Number1=true
	IsRing+=1

func _on_3_pressed():
	$SoundNode/PhoneButton.play()
	if IsRing==2:
		Number2=true
	IsRing+=1

func _on_2_pressed():
	$SoundNode/PhoneButton.play()
	if IsRing==3:
		Number3=true
	IsRing+=1

func _on_Bibliotekar_finished():
	$SoundNode/PhoneSounds/Pick_up.play()

func PhoneClick():
	$SoundNode/PhoneButton.play()
	IsRing+=1

func _on_Folder_photo():
	IsFade=true

func _on_Bowl_bowl():
	if IsKey:
		$TableThingsNode/Bowl/Sprite.set_frame(1)
		$ObjectNode/Key.show()

func _on_Shelf_EndPhoto():
	$ObjectNode/EndPhoto.show()

func _on_Letter_pressed():
	$Gui/Popup.hide()


func _on_PreCall_finished():
	$SoundNode/PhoneSounds/Call.play()


func _on_Call_finished():
	$SoundNode/PhoneSounds/Hang_up.play()


func _on_Hang_up_finished():
	$SoundNode/Bibliotekar.play()

func _on_Pick_up_finished():
	IsPhoto=true

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_Right_input_event(viewport, event, shape_idx):
	if event.is_action_released("click"):
		if $ObjectNode/Folder/Pages.get_frame()==1 and OneTimePhoto==false:
				$ObjectNode/Folder/Pages/Photo.show()
