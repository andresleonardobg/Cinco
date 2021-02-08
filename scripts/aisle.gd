extends Node2D

func _ready():
	$Camera2D.position.x = Global.posAisle

func _process(delta):

	$Camera2D.position.x = get_global_mouse_position().x

