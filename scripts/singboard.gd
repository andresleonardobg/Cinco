extends Control

var lenguages = [
	[
		"Sistemas",
		"Alcoba",
		"Cocina",
		"Taller"
	],
	[
		"Systems",
		"Bedroom",
		"Kitchen",
		"Workshop"
	]
]

func _ready() -> void:
	$Systems.text = lenguages[Global.lenguage][0]
	$Bedroom.text = lenguages[Global.lenguage][1]
	$Kitchen.text = lenguages[Global.lenguage][2]
	$Workshop.text = lenguages[Global.lenguage][3]
