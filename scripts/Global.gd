extends Node

var lenguage = 0

var softwareLoad = false
var capsule = false
var map
var cabina
var lights_state = true

var nav #= get_tree().get_nodes_in_group('navigation')
var lights #= get_tree().get_nodes_in_group('lights')
var nav_cam #= get_tree().get_nodes_in_group('nav_cam')

#dialogos
var inRoom = true
var firts_dialog = true
var dialog = load("res://scenes/dialogs.tscn")
var node_level
var taller

#nav visible and block obj
var vis = true
var obj = false


var music = [AudioStreamPlayer.new(), AudioStreamPlayer.new(), AudioStreamPlayer.new()]
var ambient = load("res://assets/music/ambient.mp3")
var ambient_two = load("res://assets/music/ambient-2.mp3")
var ambient_three = load("res://assets/music/ambient-3.mp3")


func show_dialog(t, node):
	var d = dialog.instance()
	d.textSelected = t
	node.add_child(d)

func _ready() -> void:
	
	_add_music(music[0], ambient, -16)
	_add_music(music[1], ambient_two, -80)
	_add_music(music[2], ambient_three, -80)
	pass

func _add_music(m,s, v) -> void:
	m.set_stream(s)
	m.volume_db = v
	m.pitch_scale = 1
	m.play()
	add_child(m)

func _process(_delta: float) -> void:
	#dialogos
	if get_tree().get_current_scene().get_name() == "level":
		if map:
			node_level = get_node("/root/level/CanvasLayer")
			taller = get_node("/root/level/map/navigation/door7")
			
			if map.y == -4000:
				get_child(1).volume_db = 1
				
			if map.y == -4000 and map.x == -1200:
				get_child(2).volume_db = 1
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
#		if vis:
#			print('nav')
#		else:
#			print('no nav')
	
		for d in nav:
			d.visible = vis
		
		for d in nav_cam:
			d.visible = vis
		
		#lights
		for l in lights:
			l.visible = lights_state
	else:
		pass


func insert_child(area, nm, parent):
	# area.queue_free()
	var n = area.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
