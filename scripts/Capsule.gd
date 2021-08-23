extends Node2D

export (String) var node
export (String) var node2
export (String) var node3
export (String) var node4

var chip = preload("res://scenes/object.tscn")
onready var nav = get_tree().get_nodes_in_group('navigation')
onready var positions = get_tree().get_nodes_in_group('positions')
var allChips = 0
var take = true

#get map
export (NodePath) var nodeMap
onready var map = get_node(nodeMap)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if allChips == 4:
		for d in nav:
			if d.name == 'capsule':
				d.visible = true
				allChips = 0


func _on_Area2D_area_entered(area):
	if area.name == node:
		insert_child(area, 'obj', $Area2D)
		

func insert_child(area, nm, parent):
	area.queue_free()
	var n = chip.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
	allChips += 1


func _on_Area2D2_area_entered(area):
	if area.name == node2:
		insert_child(area, 'obj2', $Area2D2)


func _on_Area2D3_area_exited(area):
	if area.name == node3:
		insert_child(area, 'obj3', $Area2D3)


func _on_Area2D4_area_entered(area):
	if area.name == node4:
		insert_child(area, 'obj4', $Area2D4)


func _on_Area2D5_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			for n in nav:
				if n.name == 'door36':
					n.posMap = Vector2(-1500,-3000)

			map.global_position = Vector2(-1500,-3000)

			if take:
				for p in positions:
					if p.occupied == null:
						p.occupied = 'capsule'
						p.instance_node('capsule')
						take = false

					if take == false:
						break
			

