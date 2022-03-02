extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("move")
	$AnimationPlayer2.play("move")
