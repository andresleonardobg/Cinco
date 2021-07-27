extends Sprite

var node = preload("res://scenes/object.tscn")

func _ready():
	pass

func _on_slot_area_entered(area):
	if area.name == 'object':
		print(area.name)
		area.queue_free()
		var n = node.instance()
		n.name = 'obj'
		n.block = true
		$slots/slot.call_deferred("add_child", n)

func _on_slot2_area_entered(area):
	if area.name == 'object2':
		print(area.name)
		area.queue_free()
		var n = node.instance()
		n.name = 'obj2'
		n.block = true
		$slots/slot2.call_deferred("add_child", n)


func _on_slot3_area_entered(area):
	if area.name == 'object3':
		print(area.name)
		area.queue_free()
		var n = node.instance()
		n.name = 'obj3'
		n.block = true
		$slots/slot3.call_deferred("add_child", n)


func _on_slot4_area_entered(area):
	if area.name == 'object4':
		print(area.name)
		area.queue_free()
		var n = node.instance()
		n.name = 'obj4'
		n.block = true
		$slots/slot4.call_deferred("add_child", n)
