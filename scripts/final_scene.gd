extends Node2D


export (float) var scrolling_speed = 500.0

var lenguage = [
	"Hecho con\n\nGodot Engine\nKrita\nLMMS\n\nGracias por jugarlo",
	"Made with\n\nGodot Engine\nKrita\nLMMS\n\nthanks for playing it"
]

func _ready() -> void:
	$ColorRect/Label.text = lenguage[Global.lenguage]
	$starshiptwo/AnimationPlayer.play("move")

func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset.x += scrolling_speed * delta
	$ParallaxBackground.scroll_offset.y -= (scrolling_speed/2) * delta
	


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	$ColorRect/Label.visible = true
