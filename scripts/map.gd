extends Sprite

func _ready():
	pass 


#Botones para navegar en el mapa

func _on_left_pressed():
	if self.position.x >= 1000:
		self.position.x = -500
	else:
		self.position.x = self.position.x + 500


func _on_rigth_pressed():
	if self.position.x <= -500:
		self.position.x = 1000
	else:
		self.position.x = self.position.x - 500
