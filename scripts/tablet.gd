extends Area2D

onready var nav = get_tree().get_nodes_in_group('navigation')

func _on_tablet_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Global.vis = false
		Global.lights_state = false
		$Sprite2.visible = true
		for n in nav:
			n.visible = false
