tool
extends Area2D

export (bool) var block
export (Vector2) var posMap

#get map
export (NodePath) var nodeMap
onready var map = get_node(nodeMap)

onready var navNodes = get_tree().get_nodes_in_group('navigation')

func _ready():
	pass

#warning signal on node-----------------------------------------------------
func _get_configuration_warning():
	var warning = ""
	if not nodeMap:
		warning = "Need map node"
	return warning
#---------------------------------------------------------------------------

func _process(_delta):
	
	#depens of the position from map, if the navigation nodes are visible or not
	var navCam = true
	
	if map:
		if map.global_position.y < -1500:
			navCam = false
		else:
			navCam = true
	
	if navNodes:
		for n in navNodes:
			if n.name == 'navigationCam' or n.name == 'navigationCam2':
				n.visible = navCam
	#---------------------------------------------------------------------------


func _on_navigation_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("leftMouse"):
		
		#navigation cam---------------------------------------------------------
		if self.name == 'navigationCam' or self.name == 'navigationCam2':
			map.global_position += posMap
			print(map.global_position)
			if map.global_position.x > 0:
				map.global_position.x = -1500
			elif map.global_position.x < -1500:
				map.global_position.x = 0
		#-----------------------------------------------------------------------

		#Particles gas---------------------------------------------------------
		elif self.name == 'door3' and block == false:
			if len(get_children()) > 1:
				for n in get_children():
					if n.name == 'Particles2D':
						n.emitting = true
					
					if n.name == 'Timer':
						n.start()
			else:
				map.global_position = posMap
		#-----------------------------------------------------------------------

		else:
			if !block:
				map.global_position = posMap
			else:
				#put song here
				print('block')

#Delete particles---------------------------------------------------------------
func _on_Timer_timeout():
	map.global_position = posMap
	get_children()[1].queue_free()
	
	for n in get_children():
		if n.name == 'Particles2D':
			n.queue_free()
		
		if n.name == 'Timer':
			n.queue_free()
#--------------------------------------------------------------------------------
