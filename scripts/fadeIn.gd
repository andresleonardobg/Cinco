extends ColorRect

func _ready() -> void:
	$AnimationPlayer.play("fadeIn")
	
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	$AnimationPlayer.stop()
	self.visible = false


func _on_Area2D2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	self.visible = true
	$AnimationPlayer.play_backwards("fadeIn")
	get_tree().change_scene("res://scenes/final_dialog.tscn")
