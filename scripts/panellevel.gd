extends Area2D


func _on_panel_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		$Sprite.visible = true
		Global.vis = false
		Global.lights_state = false
