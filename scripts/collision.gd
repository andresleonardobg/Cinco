extends Area2D

#Variable de la posición que se querrar ir en el mapa
export var pos : Vector2 = Vector2(0,0)
#Tamaño del colisionador
export var sizeCol : Vector2 = Vector2(0,0)

#Obtiene la ruta del nodo desde la interfaz
export(NodePath) var node_path
export(NodePath) var particles

#obtiene las propiedades del nodo
onready var map = get_node(node_path)
onready var nodeParticles = get_node(particles)


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.scale = sizeCol
	print(node_path)


func _on_collision_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			#Establece la posición del mapa
			if self.name == "door3":
				$Timer.start()
				nodeParticles.visible = true
			else:
				map.position = pos


func _on_Timer_timeout():
	map.position = pos
