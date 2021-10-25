extends ColorRect

func _ready() -> void:
	$AnimationPlayer.play("fadeIn")
	
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	self.queue_free()