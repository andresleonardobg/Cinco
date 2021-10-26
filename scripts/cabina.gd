extends Node2D


func _on_Area2D_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == 'capsule':
		area.queue_free()
		$Area2D2.visible = true


func _on_Area2D2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		print('cambiar de escena')
