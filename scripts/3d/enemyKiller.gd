extends KinematicBody

const MOVE_SPEED = 3

export (NodePath) var node
onready var player = get_node(node)
var dead = false
 
func _ready():
	add_to_group("zombies")
 
func _physics_process(delta):
	
 
	var vec_to_player = player.translation - translation
	print(vec_to_player)
	vec_to_player = vec_to_player.normalized()
 
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
 
 

