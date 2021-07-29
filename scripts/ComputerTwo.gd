extends Sprite

var node = preload("res://scenes/object.tscn")
onready var chips = get_tree().get_nodes_in_group('slots')
var count = 0

func _ready():
	pass

func _process(_delta):
	if count == 4:
		for n in chips:
			var obj = n.get_children()
			obj[1].block = false
			obj[1].softwareLoad = true
		count = 0
	pass

func _on_slot_area_entered(area):
	if area.name == 'object':
		insert_child(area, 'obj', $slots/slot)

func _on_slot2_area_entered(area):
	if area.name == 'object2':
		insert_child(area, 'obj2', $slots/slot2)


func _on_slot3_area_entered(area):
	if area.name == 'object3':
		insert_child(area, 'obj3', $slots/slot3)


func _on_slot4_area_entered(area):
	if area.name == 'object4':
		insert_child(area, 'obj4', $slots/slot4)

func insert_child(area, nm, parent):
	area.queue_free()
	var n = node.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
	count += 1