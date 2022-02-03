extends Control

func _on_Espaol_pressed() -> void:
	Global.lenguage = 0
	get_tree().change_scene("res://scenes/level.tscn")

func _on_English_pressed() -> void:
	Global.lenguage = 1
	get_tree().change_scene("res://scenes/level.tscn")
