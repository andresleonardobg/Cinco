extends Control

onready var video = $VideoPlayer
onready var buttons = $ColorRect/language

func _on_Espaol_pressed() -> void:
	buttons.visible = false
	video.visible = true
	video.play()


func _on_English_pressed() -> void:
	video.visible = true
	buttons.visible = false
	video.play()


func _on_VideoPlayer_finished() -> void:
	$VideoPlayer/AnimationPlayer.play("fadeOut")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene("res://scenes/level.tscn")
