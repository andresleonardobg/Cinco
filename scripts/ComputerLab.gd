extends Sprite

export (Vector2) var pos

onready var door = get_tree().get_nodes_in_group('navigation')

func _ready():
	global_position = pos

func _input(_event):
#	if $block:
#		if Input.is_action_just_pressed("ui_accept"):
#			if $block/LineEdit.text == '3101':
#				$block.queue_free()
#				$desktop.visible = true
#			else:
#				$block/LineEdit.text = ''
#				#put song
	pass

func _on_Button_pressed():
	$desktop/WindowDialog.popup()

func _on_Button2_pressed():
	$desktop/AcceptDialog.popup()

func _on_AcceptDialog_confirmed():
	for d in door:
		if d.name == 'door3':
			d.block = false
	
	$AnimationPlayer.play("turnOff")

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		Global.lights_state = true
		if event.pressed and BUTTON_LEFT:
			self.visible = false
			Global.vis = true

func _on_AnimationPlayer_animation_finished(_anim_name):
	$desktop.queue_free()


func _on_ButtonPassword_pressed() -> void:
	if $block/LineEdit.text == '3101':
		$block.queue_free()
		$desktop.visible = true
	else:
		$block/LineEdit.text = ''
		#put song
