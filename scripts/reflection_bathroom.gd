extends Node2D

var dialog = load("res://scenes/dialogs.tscn")
var play = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if play and $principal.visible:
		$principal/Sprite/AnimationPlayer.play("fadeIn")
		Global.show_dialog(4, self)

func _vis() -> void:
	$principal/ColorRect.visible = false

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	#$principal/ColorRect.visible = false
	play = false
	$principal/Sprite/AnimationPlayer.stop()
	_vis()

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		$principal.visible = false
		$principal/ColorRect.visible = true
		$Area2D2.visible = true
		Global.vis = true
		$principal/Sprite/AnimationPlayer.play_backwards("fadeIn")


func _on_Area2D2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click"):
		$principal.visible = true
		$Area2D2.visible = false
		Global.vis = false
		play = true
		$principal/ColorRect.visible = true
		
