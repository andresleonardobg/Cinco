extends KinematicBody

var move = Vector3()
var MOVE_SPEED = 4
var MOVE_SPEED_L = 0


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	
	move.x += MOVE_SPEED_L
	move.z -= 1
	move = move.normalized()
	move_and_collide(move * MOVE_SPEED * delta)

func kill() -> void:
	MOVE_SPEED = 0
	$CollisionShape.disabled = true
	$AnimatedSprite3D.animation = "death"
	pass


func _on_Area_body_entered(body: Node) -> void:
	if body.name == "player":
		var rng = RandomNumberGenerator.new()
		var dir = rng.randf_range(0.0, 10.0)
		
		if dir < 5:
			MOVE_SPEED_L = 1
		elif dir > 5:
			MOVE_SPEED_L = -1


func _on_Area_body_exited(body: Node) -> void:
	MOVE_SPEED_L = 0
