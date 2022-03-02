extends Sprite

export (Vector2) var pos

signal visiblenode(vis)

onready var door = get_tree().get_nodes_in_group('navigation')

var lenguages = [
		[
			"Contraseña",
			"Aceptar",
			" Abrir puerta",
			"Ya has despertado, bien. Para que puedas salir de este nivel en el siguiente icono podras abrir la puerta del laboratorio y venir a donde estoy. Te espero cinco."
			], 
		[
			"Password",
			"Accept",
			"   Open door",
			"You're wake up, good. So you can get out of this level you can click on the next icon, the door of the lab will open it. Come here where I am. I wait for you, five."
		]
	]

func _ready():
	
	#set text
	$block/Label.text = lenguages[Global.lenguage][0]
	$block/ButtonPassword.text = lenguages[Global.lenguage][1]
	$desktop/AcceptDialog.dialog_text = lenguages[Global.lenguage][2]
	$desktop/WindowDialog/RichTextLabel.text = lenguages[Global.lenguage][3]
	
	global_position = pos

func _input(event):
	if event is InputEventKey and event.pressed:
		$keyboard.play()

func _process(_delta: float) -> void:
	if visible:
		emit_signal("visiblenode", visible)
		set_process(false)

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
		set_process(true)
		Global.lights_state = true
		if event.pressed and BUTTON_LEFT:
			self.visible = false
			Global.vis = true

func _on_AnimationPlayer_animation_finished(_anim_name):
	$desktop.queue_free()
	$shader.queue_free()
	$computer_on.queue_free()
	
	if get_node("../../../lights/lights/Light2D10"):
		get_node("../../../lights/lights/Light2D10").queue_free()


func _on_ButtonPassword_pressed() -> void:
	if $block/LineEdit.text == '4212':
		$block.queue_free()
		$desktop.visible = true
	else:
		$block/LineEdit.text = ''
		$block/ButtonPassword/AudioStreamPlayer.play()


func _on_ComputerLab_visiblenode(vis : bool) -> void:
	if $computer_on:
		if vis:
			$computer_on.play()


func _on_ComputerLab_hide() -> void:
	if $computer_on:
		$computer_on.stop()
