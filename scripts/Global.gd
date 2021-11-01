extends Node

var softwareLoad = false
var capsule = false
var map
var cabina

onready var nav = get_tree().get_nodes_in_group('navigation')

#dialogos
var inRoom = true
var firts_dialog = true
var dialog = load("res://scenes/dialogs.tscn")
var node_level
var taller

#nav visible and block obj
var vis = true
var obj = false

func show_dialog(t, node):
	var d = dialog.instance()
	d.textSelected = t
	node.add_child(d)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#dialogos
	if get_tree().get_current_scene().get_name() == "level":
		if map:
			node_level = get_node("/root/level")
			taller = get_node("/root/level/map/navigation/door7")
		#cuando se encuentra por primera vez al viejo
			if map.y == -4000 and map.x == 0 and firts_dialog:
				show_dialog(1, node_level)
				firts_dialog = false
			#luego de cargar el software
			if map.y == -4000 and softwareLoad:
				softwareLoad = false
				taller.block = false
				show_dialog(2, node_level)
	
	#abrir cabina principal
		if cabina:
			var node_cabina = get_node("/root/level/map/navigation/door26")
			node_cabina.block = false
	
	
	#nav visible
		for d in nav:
			d.visible = vis
	
	else:
		pass

func insert_child(area, nm, parent):
	# area.queue_free()
	var n = area.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
