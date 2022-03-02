extends ColorRect

func _ready() -> void:
	$AnimationPlayer.play("fadeIn")
	
func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	$AnimationPlayer.stop()
	self.visible = false
