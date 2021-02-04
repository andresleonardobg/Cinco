extends Control

export(NodePath) var door
onready var open = get_node(door)

func _ready():
	$ColorRect/Control/Label.text = "Ingrese la contraseña"


#Validación de la contraseña
func _input(event):
	if Input.is_action_pressed("ui_accept") && $ColorRect/Control/LineEdit.text == "3101":
			$ColorRect/Control/AcceptDialog.visible = true
	
	if Input.is_action_pressed("ui_accept") && $ColorRect/Control/LineEdit.text != "3101":
		$ColorRect/Control/Label.text = "Intente nuevamente"
		$ColorRect/Control/LineEdit.text = ""


func _on_AcceptDialog_confirmed():
	$ColorRect/Control.queue_free()
	$ColorRect/Container.visible = true


func _on_Button_pressed():
	$ColorRect/Container/WindowDialog.popup()


func _on_Button2_pressed():
	$ColorRect/Container/ConfirmationDialog.popup()


func _on_ConfirmationDialog_confirmed():
	$ColorRect2.visible = true
	$ColorRect2/AnimationPlayer.play("off")


func _on_AnimationPlayer_animation_finished(anim_name):
	$ColorRect/Container.queue_free()
	open.open = true
