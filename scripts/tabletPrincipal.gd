extends Sprite

onready var nav = get_tree().get_nodes_in_group('navigation')


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Global.lights_state = true
		self.visible = false
		for n in nav:
				n.visible = true
