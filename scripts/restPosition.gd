extends Position2D

export (Color) var colors
var empty = true
var nombre = null

func _draw():
	draw_rect(Rect2(Vector2(-40,-40), Vector2(80,80)), colors)

func _on_Area2D_area_entered(area):
	nombre = area.name

func _on_Area2D_area_exited(area):
	pass
