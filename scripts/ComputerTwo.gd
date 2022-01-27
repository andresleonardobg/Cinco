extends Sprite

var node = preload("res://scenes/object.tscn")
onready var chips = get_tree().get_nodes_in_group('slots')
var count = 0

func _ready():
	pass

func _process(_delta):
	if count == 4:
		$Computer/RichTextLabel.visible = false
		$Computer/RichTextLabel2.visible = true
		$Computer/RichTextLabel2/Timer.start()
		count = 0

func _on_slot_area_entered(area):
	if area.name == 'object':
		insert_child(area, 'obj', $slots/slot)
		$slots/slot/move.play("embedded")

func _on_slot2_area_entered(area):
	if area.name == 'object2':
		insert_child(area, 'obj2', $slots/slot2)
		$slots/slot2/move.play("embedded")


func _on_slot3_area_entered(area):
	if area.name == 'object3':
		insert_child(area, 'obj3', $slots/slot3)
		$slots/slot3/move.play("embedded")


func _on_slot4_area_entered(area):
	if area.name == 'object4':
		insert_child(area, 'obj4', $slots/slot4)
		$slots/slot4/move.play("embedded")

func insert_child(area, nm, parent):
	area.queue_free()
	var n = node.instance()
	n.name = nm
	n.block = true
	parent.call_deferred("add_child", n)
	count += 1


func _on_Timer_timeout():
	$Computer/RichTextLabel2.visible = false
	$Computer/load.visible = true
	$Computer/load/ColorRect/AnimationPlayer.play("load")
	


func _on_AnimationPlayer_animation_finished(_anim_name):
	$Computer/load/ColorRect2/AnimationPlayer2.play("load")


func _on_AnimationPlayer2_animation_finished(_anim_name):
	$Computer/load/ColorRect3/AnimationPlayer3.play("load")


func _on_AnimationPlayer3_animation_finished(_anim_name):
	$Computer/load/ColorRect4/AnimationPlayer4.play("load")
	

func _on_AnimationPlayer4_animation_finished(_anim_name):
	Global.capsule = true
	$Computer/RichTextLabel2.text = 'carga completa'
	$Computer/RichTextLabel2.visible = true
	$Computer/load.visible = false
	for n in chips:
		var obj = n.get_children()
		obj[2].block = false
		Global.softwareLoad = true
