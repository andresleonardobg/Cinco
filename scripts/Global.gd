extends Node

var pos = Vector2(1000,2000) #posición inicial del mapa
var mapPos #posion del mapa mientras juega

var dialogos = [
	'Debes de estar hambriento, por favor ignora el desorden ve a la cocina, allá podrás encontrar algo que comer'
]

var dialogNode = preload("res://scenes/Dialogues.tscn")
onready var invenNode = preload("res://scripts/Inventory.gd")
var posDialogo = Vector2(25, -120)

var dialogoPasillo = true

func instance_node(node, parent, pos, texto):
	var node_instance = node.instance()
	node_instance.rect_position = pos
	node_instance.texto = texto
	parent.add_child(node_instance)
	return node_instance
