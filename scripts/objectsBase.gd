extends Node2D

var pieza = []
var pieza_superior = ""

var seleccion = null

onready var objs = get_tree().get_nodes_in_group('object')

func ordena():
	if pieza.size() >= 2:
		pieza.sort()
		pieza_superior = pieza[-1]

	if pieza.size() == 1:
		pieza_superior = pieza[0]

func ver_pieza(nombre):
	pieza.append(nombre)
	ordena()

func no_ver_pieza(nombre):
	pieza.erase(nombre)
	ordena()

func _process(_delta):
	if seleccion != null:
		var mouse_pos = get_global_mouse_position()
		seleccion.z_index = 2
		seleccion.global_position = mouse_pos - seleccion.mi_pos
