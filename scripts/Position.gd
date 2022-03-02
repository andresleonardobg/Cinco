extends Area2D

var occupied = null
var node = preload("res://scenes/object.tscn")
var textu_ = preload("res://assets/capsule.png")

#func _draw():
#	draw_rect(Rect2(Vector2(-25,-25), Vector2(50, 50)), Color(1.0, 0.0, 0.0, 1.0), false)

func _process(_delta):

	if len(get_children()) < 2:
		occupied = null

func instance_node(nod, sl):
	var n = node.instance()
	n.name = nod
	n.softwareLoad = sl
	add_child(n)

func instance_node_capsule(nod, sl):
	var n = node.instance()
	n.texture_ = textu_
	n.name = nod
	n.softwareLoad = sl
	add_child(n)
