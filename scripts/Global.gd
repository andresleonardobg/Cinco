extends Node

var pos = Vector2(1000,2000) #posición inicial del mapa
var mapPos #posion del mapa mientras juega

var dialogos = [
	'Debes de estar hambriento, por favor ignora el desorden ve a la cocina, allá podrás encontrar algo que comer',
	'necesito que me ayudes, cinco/quién eres?/eso ya no importa en mi estado, como ves no aparento pasar de hoy y antes de que eso suceda necesito que hagas algo por mi/pero donde estoy/El viejo toce no puedo hablar./solo has lo que te digo no creo que haya más opciones por lo mucho que has visto/Toce/toma este chip ve al cuarto que sigue a este ahí encontraras más de estos, debes reprogramarlos cerca al computador encontraras una memoria con el programa a cargar vuelve cuando hayas terminado/El hombre se ha dormido, no le queda mucho tiempo. Qué lugar es este, estaré en alguna clase de bunker, como llegue aquí'
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
