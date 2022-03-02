extends Node2D

#get map
export (NodePath) var node
onready var comp = get_node(node)



func _on_Area2D_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		
		$paper.play()
		
		Global.lights_state = false
		Global.vis = false
		$small.visible = false
		$big.visible = true
		Global.vis = false
		comp.visible = false


func _on_Area2D2_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		
		$paper.play()
		
		Global.lights_state = true
		Global.vis = true
		$small.visible = true
		$big.visible = false
		Global.vis = true
		comp.visible = true
