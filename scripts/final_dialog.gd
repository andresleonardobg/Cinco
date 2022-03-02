extends Node2D

var dialogs = load("res://scenes/dialogs.tscn")
var verificar = false

func _ready() -> void:
	$ColorRect/AnimationPlayer.play("fadeIn")
	pass

func dialog():
	var d = dialogs.instance()
	d.rect_position = Vector2(50, 20)
	d.textSelected = 3
	self.add_child(d)

func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	$ColorRect.queue_free()
	dialog()
	verificar = true

func _process(_delta: float) -> void:
	
	if verificar:
		if !self.has_node("Dialog"):
			$ColorRect2.visible = true
			$ColorRect2/AnimationPlayer2.play("fadeOut")


func _on_AnimationPlayer2_animation_finished(_anim_name: String) -> void:
	get_tree().change_scene("res://scenes/final_scene.tscn")
