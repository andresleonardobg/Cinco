extends Area2D

#Variable de la posición que se querrar ir en el mapa
export var pos : Vector2 = Vector2(0,0)
#Tamaño del colisionador
export var sizeCol : Vector2 = Vector2(0,0)

#Obtiene la ruta del nodo desde la interfaz
export(NodePath) var node_path

#obtiene las propiedades del nodo
onready var node = get_node(node_path)


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.scale = sizeCol


func _on_collision_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			#Establece la posición del mapa
			node.position = pos
