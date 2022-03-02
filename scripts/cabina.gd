extends Node2D


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.name == 'capsule':
		$Area2D/Sprite.visible = true
		$Area2D/Sprite/move.play("embedded")
		area.queue_free()


func _on_Area2D2_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		$ColorRect.visible = true
		$ColorRect/AnimationPlayer.play("fadeOut")


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	get_tree().change_scene("res://scenes/final_dialog.tscn")


func _on_move_animation_finished(_anim_name: String) -> void:
	$fit.play()
	$on_monitor.play()
	$Light2D.visible = true
	$Light2D/AnimationPlayer.play("on")
	$Area2D2.visible = true
