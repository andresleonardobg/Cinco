extends ColorRect

var texto = "necesito que me ayudes, cinco/quién eres?/eso ya no importa en mi estado, como ves no aparento pasar de hoy y antes de que eso suceda necesito que hagas algo por mi/pero donde estoy/El viejo toce no puedo hablar./solo has lo que te digo no creo que haya más opciones por lo mucho que has visto/Toce/toma este chip ve al cuarto que sigue a este ahí encontraras más de estos, debes reprogramarlos cerca al computador encontraras una memoria con el programa a cargar vuelve cuando hayas terminado/El hombre se ha dormido, no le queda mucho tiempo. Qué lugar es este, estaré en alguna clase de bunker, como llegue aquí"
var t
var p = 0
var canChange = false


#doors
export (NodePath) var door
onready var doors = get_node(door) 

func _ready():
	t = texto.split("/")
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.text = t[0]
	$Timer.start()

func _input(_event):
	if self.visible:
		
		#block objects and doors
		doors.visible = false
		
		
		if Input.is_action_just_pressed("click") and canChange:
			if p < t.size() - 1:
				p = p+ 1
				$RichTextLabel.visible_characters = 0
				$RichTextLabel.text = t[p]
				canChange = false
			else:
				self.visible = false
	else:
		#unlock objects and doors
		doors.visible = true


func _on_Timer_timeout() -> void:
	if $RichTextLabel.visible_characters <= len(t[p]):
		$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_characters == len(t[p]):
		canChange = true
