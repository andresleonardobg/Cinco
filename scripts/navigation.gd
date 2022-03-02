tool
extends Area2D

export (bool) var block
export (Vector2) var posMap

#get map
export (NodePath) var nodeMap
onready var map = get_node(nodeMap)

onready var navNodes = get_tree().get_nodes_in_group('navigation')

#panel
onready var panel = get_node("/root/level/map/interaction/panel/Sprite")

var vis


#lab door state
var firts_time = true

#warning signal on node-----------------------------------------------------
func _get_configuration_warning():
	var warning = ""
	if not nodeMap:
		warning = "Need map node"
	return warning
#---------------------------------------------------------------------------

func _process(_delta):
	
	vis = true
	
	#depens of the position from map, if the navigation nodes are visible or not
	var navCam = true
	
	if map:
		if vis == false:
			navCam = false
		else:
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

	if self.visible:
		if Input.is_action_just_pressed("leftMouse"):
			#foot steps sound
			if block:
				$AudioStreamPlayer2.play()
			else:
				$AudioStreamPlayer.play()
			
			#navigation cam---------------------------------------------------------
			if self.name == 'navigationCam' or self.name == 'navigationCam2':
				map.global_position += posMap
				print(map.global_position)
				if map.global_position.x > 0:
					map.global_position.x = -1800
				elif map.global_position.x < -1800:
					map.global_position.x = 0
			#-----------------------------------------------------------------------

			#Particles gas---------------------------------------------------------
			elif self.name == 'door3' and block == false and firts_time:
				firts_time = false
				Global.vis = false
				lab_door()
			#-----------------------------------------------------------------------

			else:
				if !block:
					map.global_position = posMap


#animation lab door
func lab_door() -> void:
	var particles = get_node("../../door_animation/Particles2D")
	var spray = get_node("../../door_animation/spray")
	var opendoor_animate = get_node("../../door_animation/doors/AnimationPlayer")
	var timer = get_node("../../door_animation/Timer")
	
	particles.emitting = true
	spray.play()
	timer.start()
	opendoor_animate.play("opendoors")

#Delete particles---------------------------------------------------------------
func _on_Timer_timeout():
	Global.vis = true
	map.global_position = posMap
	$AudioStreamPlayer.play()
	
	get_node("../../door_animation/Particles2D").queue_free()
	get_node("../../door_animation/Timer").queue_free()
#--------------------------------------------------------------------------------

#delete doors door3 node
func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	get_node("../../door_animation/doors/AnimationPlayer").queue_free()
