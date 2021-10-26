extends KinematicBody

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5

onready var raycast = $RayCast

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("click"):
		$CanvasLayer/Control/AnimatedSprite.playing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
	
	if Input.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta: float) -> void:
	
	var move = Vector3()
	
	if Input.is_action_pressed("up"):
		move.z -=1
	if Input.is_action_pressed("down"):
		move.z +=1
	if Input.is_action_pressed("left"):
		move.x -=1
	if Input.is_action_pressed("right"):
		move.x +=1
	
	move = move.normalized()
	move = move.rotated(Vector3(0,1,0), rotation.y)
	move_and_collide(move * MOVE_SPEED * delta)
	
	if Input.is_action_pressed("click"):
		var coll = raycast.get_collider()
		
		#and coll.has_method("kill")
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()
			print("funciona")

func _on_AnimatedSprite_animation_finished() -> void:
	$CanvasLayer/Control/AnimatedSprite.playing = false
