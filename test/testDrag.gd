extends StaticBody2D

var mol 
var take = false
onready var test = get_tree().get_nodes_in_group('test')

func _ready():
	print(z_index)
	mol = $Sprite.modulate

func _input(event):
	if Input.is_action_just_released("leftMouse"):
		take =false

func _process(delta):
	if take:
		self.position = get_global_mouse_position()


#func _on_StaticBody2D_mouse_entered():
#	$Sprite.modulate = Color(150, 50, 0, 1.0)
#	print('funciona')
#
#
#func _on_StaticBody2D_mouse_exited():
#	$Sprite.modulate = mol


func _on_StaticBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouse:
		if event.is_pressed():
			take = true
			z_index = 1
			
			for t in test:
				if t.name != self.name:
					t.z_index = 0
