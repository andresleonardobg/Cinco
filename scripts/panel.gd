extends Sprite

onready var text_box = $Label
onready var buttons = get_tree().get_nodes_in_group("panel")

func _ready() -> void:
	for n in buttons:
		n.connect("pressed", self, "keyboard",[n.name])

func keyboard(dig) -> void:
	$keyboard.play()
	
	if dig == "delete":
		 text_box.set_text("")
	elif dig == "check":
		if text_box.get_text() == "2051":
			$Confirm.play()
			Global.cabina = true
			text_box.set_text("")
		else:
			$Error.play()
			text_box.set_text("")
	else:	
		if text_box.get_total_character_count() < 4:
			text_box.set_text(text_box.get_text() + dig)

func _on_Area2D_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Global.lights_state = true
		Global.vis = true
		self.visible = false
