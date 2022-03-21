extends Node2D

var dialogs = load("res://scenes/dialogs.tscn")
var verificar = false
var lenguage = [
	"Hecho con\n\nGodot Engine\nKrita\nLMMS\n\nGracias por jugarlo",
	"Made with\n\nGodot Engine\nKrita\nLMMS\n\nthanks for playing it"
]

var count = 0

func _ready() -> void:
	$ColorRect/AnimationPlayer.play("fadeIn")
	$ColorRect4/Label.text = lenguage[Global.lenguage]

func _input(event: InputEvent) -> void:

	if Input.is_action_pressed("click"):
		count += 1
	
	

func dialog():
	var d = dialogs.instance()
	d.rect_position = Vector2(50, 20)
	d.textSelected = 3
	self.add_child(d)

func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	$ColorRect.queue_free()
	dialog()
	verificar = true

func _process(_delta: float) -> void:
	
	if count == 4:
		$AnimatedSprite.set_animation("fall")
	
	if verificar:
		if !self.has_node("Dialog"):
			$ColorRect2.visible = true
			$ColorRect2/AnimationPlayer2.play("fadeOut")


func _on_AnimationPlayer2_animation_finished(_anim_name: String) -> void:
	$ColorRect4.visible = true
