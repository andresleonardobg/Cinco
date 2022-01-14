extends Sprite

onready var text_box = $Label

func _ready() -> void:
	pass 


func _on_Button_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "1")


func _on_Button2_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "2")


func _on_Button3_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "3")


func _on_Button4_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "4")


func _on_Button5_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "5")


func _on_Button6_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "6")


func _on_Button7_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "7")


func _on_Button8_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "8")


func _on_Button9_pressed() -> void:
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "9")


func _on_Button10_pressed() -> void:
	#cero
	if text_box.get_total_character_count() < 4:
		text_box.set_text(text_box.get_text() + "0")


func _on_Button11_pressed() -> void:
	#borrar
	text_box.set_text("")


func _on_Button12_pressed() -> void:
	#aceptar
	if text_box.get_text() == "2051":
		#sonido aprobado
		Global.cabina = true
		text_box.set_text("")
		print('cabina codigo correcto')
	else:
		#sonido de error
		text_box.set_text("")


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Global.lights_state(true)
		Global.vis = true
		self.visible = false
