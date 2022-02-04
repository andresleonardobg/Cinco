extends Area2D

var softwareLoad

var block = false

var take = null
 
var inInvent = false

onready var positions = get_tree().get_nodes_in_group('positions')

var texture_ = preload("res://assets/chip.png")

func _ready():
	$Sprite.texture = texture_
	self.add_to_group('objects')

func _on_object_input_event(_viewport, event, _shape_idx):
	if Global.obj == false:
		if event is InputEventMouseButton:
			if event.pressed and event.button_index == BUTTON_LEFT and block == false:
				take = true
			elif !event.pressed and block == false:
				take = false
				
				if inInvent == false:
					for p in positions:
						if p.occupied == null:
							queue_free()
							p.occupied = self.name
							p.instance_node(self.name, softwareLoad)
							inInvent = true
					
						if inInvent:
							break

func _process(_delta):
	
	softwareLoad = Global.softwareLoad
	
	if take and block == false:
		self.global_position = get_global_mouse_position()
		z_index = 2
	elif !take and take != null and block == false:
		self.global_position = lerp(self.global_position, get_parent().global_position, 0.5)
		z_index = 1


func _on_object_area_entered(area):
	
	for p in positions:
		if area.name == p.name:
			inInvent = true
