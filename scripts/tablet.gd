extends Area2D

onready var nav = get_tree().get_nodes_in_group('navigation')

func _on_tablet_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		$Sprite2.visible = true
		for n in nav:
			n.visible = false
