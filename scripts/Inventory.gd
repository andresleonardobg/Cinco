extends Node2D

var play = false

func _on_Button_pressed():
	
	play = !play
	
	if play:
		$Button/AnimationPlayer.play("hideShow")
	else:
		$Button/AnimationPlayer.play_backwards("hideShow")
