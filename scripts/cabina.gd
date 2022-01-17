extends Node2D


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.name == 'capsule':
		$Area2D/Sprite.visible = true
		$Light2D.visible = true
		$Light2D/AnimationPlayer.play("on")
		area.queue_free()
		$Area2D2.visible = true


func _on_Area2D2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		$ColorRect.visible = true
		$ColorRect/AnimationPlayer.play("fadeOut")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene("res://scenes/final_dialog.tscn")
