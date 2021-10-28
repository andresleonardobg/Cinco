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
	if map:
		if get_tree().get_current_scene().get_name() == "level":
		#cuando se encuentra por primera vez al viejo
			if map.y == -4000 and map.x == 0 and firts_dialog:
				show_dialog(1, node_level)
				firts_dialog = false
			#luego de cargar el software
			if map.y == -4000 and softwareLoad:
				show_dialog(2, node_level)
				softwareLoad = false
				for d in nav:
					if d.name == 'door7':
						d.block = false
	
	#abrir cabina principal
	if get_tree().get_current_scene().get_name() == "level":
		if cabina:
			for d in nav:
					if d.name != null and d.name == 'door26':
						d.block = false
	
	
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
