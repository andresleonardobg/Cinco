extends Node2D

var image = preload("res://assets/mouse2.png")
var image2 = preload("res://assets/mouseOver.png")
var change = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _process(delta):
	$Sprite.position = get_global_mouse_position()
	
	if change:
		$Sprite.frame = 1
		
	if change == false:
		$Sprite.frame = 0


func _on_Area2D_area_entered(area):
	change = true
	print("adentro")


func _on_Area2D_area_exited(area):
	change = false
	print("fuera")


func _on_Area2D_body_entered(body):
	print("detectado")
