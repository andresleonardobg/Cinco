extends Area2D

export (String) var name_node

export (NodePath) var nodeNav
onready var navInv = get_node(nodeNav)
onready var note = get_node("/root/level/map/interaction/note")

func _ready():
	pass

func _process(_delta):
	if $ComputerLab.visible:
		$CollisionShape2D.visible = false
		note.visible = false
	else:
		$CollisionShape2D.visible = true
		note.visible = true

func _on_interactive_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and BUTTON_LEFT:
			for node in get_children():
				if node.name == name_node:
					node.visible = true
				
				if node.name == 'CollisionShape2D':
					node.visible = false
					Global.vis = false
