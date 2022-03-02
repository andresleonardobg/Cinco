extends Control

onready var keyboard = $keyboard

func _on_Espaol_pressed() -> void:
	keyboard.play()
	Global.lenguage = 0
	get_tree().change_scene("res://scenes/level.tscn")

func _on_English_pressed() -> void:
	keyboard.play()
	Global.lenguage = 1
	get_tree().change_scene("res://scenes/level.tscn")
