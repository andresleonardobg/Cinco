extends Sprite

var restPoints
export (String) var nombre 

var pick = false
var take = false

func _ready():
	restPoints = get_tree().get_nodes_in_group("positions")
	$Area2D.name = nombre
	print(self.global_position)
	
func _input(event):
	if pick and take:
		self.global_position = get_global_mouse_position()

	if pick and !take:
		_position()

func _process(delta):
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("click"):
			take = true
			pick = true
		elif Input.is_action_just_released("click"):
			take = false

func _position():
	for pos in len(restPoints):
		if restPoints[pos].nombre == nombre or restPoints[pos].nombre == null:
			self.global_position = restPoints[pos].global_position
