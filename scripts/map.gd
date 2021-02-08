extends Sprite

export(NodePath) var node_path
onready var node = get_node(node_path)

export(NodePath) var node_path_2
onready var node_2 = get_node(node_path)

func _process(delta):
	self.position = Global.pos
	_buttomVisibility(node)
	if self.visible == false or self.position == Vector2(0, -500):
		$CanvasLayer/left.visible = false
		$CanvasLayer/rigth.visible = false

func _on_left_pressed():
	if Global.pos.x >= 1000:
		Global.pos.x = -500
	else:
		Global.pos.x = Global.pos.x + 500


func _on_rigth_pressed():
	if Global.pos.x <= -500:
		Global.pos.x = 1000
	else:
		Global.pos.x = Global.pos.x - 500

#Quitar visivilidad de los botones de navegación
func _buttomVisibility(node):
	if node != null:
		if node.visible:
			$CanvasLayer/left.visible = false
			$CanvasLayer/rigth.visible = false
	else:
		$CanvasLayer/left.visible = true
		$CanvasLayer/rigth.visible = true
