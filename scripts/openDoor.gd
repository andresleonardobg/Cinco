extends Sprite

export (NodePath) var nodeMap
onready var map = get_node(nodeMap)

func _ready():
	pass 

func _process(_delta):
	if map:
		if map.global_position.x == -1500:
			$AnimationPlayer.play("openDoor")


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
