extends Node2D

#get map
export (NodePath) var node
onready var comp = get_node(node)



func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		
		Global.lights_state = false
		
		$small.visible = false
		$big.visible = true
		Global.vis = false
		comp.visible = false


func _on_Area2D2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		
		Global.lights_state = true
		
		$small.visible = true
		$big.visible = false
		Global.vis = true
		comp.visible = true
