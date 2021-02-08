extends Area2D

var unlock = false
#Variable de la posición que se querrar ir en el mapa
export var pos : Vector2 = Vector2(0,0)
#Tamaño del colisionador
export var sizeCol : Vector2 = Vector2(0,0)

#Obtiene la ruta del nodo desde la interfaz
export(NodePath) var node_path
export(NodePath) var node_path_2

#obtiene las propiedades del nodo
onready var node = get_node(node_path)
onready var node2 = get_node(node_path_2)
onready var nodeTest = get_node("/root/Game/map")
onready var nodeTest2 = get_node("/root/Game/aisle")


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.scale = sizeCol


func _on_collision_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			#Establece la posición del mapa
			if self.name == "door3":
				if unlock:
					$Timer.start()
					node2.visible = true
			elif self.name == "computer":
				#Muestra el computador
				node.visible = true
				node2.visible = false
			elif self.name == "note":
				#Muestra la nota onde esta el codigo
				node.visible = true
			elif self.name == "note2":
				#Muestra la nota onde esta el codigo
				node.visible = true
			elif self.name == "door9":
				get_tree().change_scene("res://scenes/aisle.tscn")
				
			#Cuartos del pasillo
			elif self.name == "door11":
				get_tree().change_scene("res://scenes/aisle.tscn")
				Global.posAisle = 0
			elif self.name == "door13":
				get_tree().change_scene("res://scenes/aisle.tscn")
				Global.posAisle = 550
			elif self.name == "door14":
				get_tree().change_scene("res://scenes/aisle.tscn")
				Global.posAisle = 1425
			elif self.name == "door15":
				get_tree().change_scene("res://scenes/aisle.tscn")
				Global.posAisle = 1920
				
			#Puertas del pasillo
			elif self.name == "Cocina":
				get_tree().change_scene("res://scenes/Game.tscn")
				Global.pos = Vector2(1000, 0)
			elif self.name == "Taller":
				get_tree().change_scene("res://scenes/Game.tscn")
				Global.pos = Vector2(0, 0)
			elif self.name == "Cabina":
				get_tree().change_scene("res://scenes/Game.tscn")
				Global.pos = Vector2(0, -500)
			elif self.name == "Laboratorio":
				get_tree().change_scene("res://scenes/Game.tscn")
				Global.pos = Vector2(-500, 0)
			elif self.name == "Cuarto":
				get_tree().change_scene("res://scenes/Game.tscn")
				Global.pos = Vector2(1000, -500)
			else:
				Global.pos = pos


func _on_Timer_timeout():
	Global.pos = pos
