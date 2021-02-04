extends Node2D

func _process(delta):
	$Camera2D.position.x = get_global_mouse_position().x
	pass
