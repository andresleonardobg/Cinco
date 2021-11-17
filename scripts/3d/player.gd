extends KinematicBody

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5

onready var raycast = $RayCast

#dialog
var dialog = load("res://scenes/dialogs.tscn")

var count = 0

func show_dialog(t, node):
	var d = dialog.instance()
	d.textSelected = t
	node.add_child(d)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	$CanvasLayer/ColorRect/AnimationPlayer.play("fadeIn")

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


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	count += 1
	print(count)
	if count == 2:
		get_tree().quit()
	print(anim_name)


func _on_Area_body_entered(body: Node) -> void:
	if body.name == "myself":
		print('funciona')
		show_dialog(5, $CanvasLayer)
		$CanvasLayer/ColorRect/AnimationPlayer.play_backwards("fadeIn")
