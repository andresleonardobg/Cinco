extends Node

var softwareLoad = false


func insert_child(area, nm, parent):
	# area.queue_free()
	var n = area.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
