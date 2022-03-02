extends Node2D

onready var sprite = $Sprite

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()

func _on_Area2D_area_entered(_area: Area2D) -> void:
	sprite.frame = 1


func _on_Area2D_area_exited(_area: Area2D) -> void:
	sprite.frame = 0


func _on_Area2D_body_entered(_body: Node) -> void:
	sprite.frame = 1


func _on_Area2D_body_exited(_body: Node) -> void:
	sprite.frame = 0
