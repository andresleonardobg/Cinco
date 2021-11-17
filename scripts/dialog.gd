 extends ColorRect

var textSelected : int

var texto = [
	[
		"El hombre se ha dormido, no le queda mucho tiempo.",
		"necesito que me ayudes, cinco/quién eres?/eso ya no importa en mi estado, como ves no aparento pasar de hoy y antes de que eso suceda necesito que hagas algo por mi/pero donde estoy/(el viejo toce no puedo hablar)/solo has lo que te digo no creo que haya más opciones por lo mucho que has visto/(toce)/toma este chip ve al cuarto que sigue a este ahí encontraras más de estos, debes reprogramarlos cerca al computador encontraras una memoria con el programa a cargar vuelve cuando hayas terminado/El hombre se ha dormido, no le queda mucho tiempo. Qué lugar es este, estaré en alguna clase de bunker, como llegue aquí",
		"toma este diagrama y ve a la siguiente puerta es la misma contraseña",
		"me he quedado varado en mitad de la nada / al salir de ese horrible planeta algunos disparos lograron averiar gran parte de la nave / pude salir y reparar gran parte de la superficie pero no ha sido suficiente / no creo que lo pueda hacer solo así que he tomado uno de los embriones de la nave y lo puse en la capsula para que madurara, no se me ocurre más  / espero no tener que despertar a mas pero no creo que logremos terminarlo por eso hago este mensaje / no soy ingeniero, hay alguna información en la nave dado que era de uno de los científicos / así fue que aprendí a despertar a uno pero. / Nos costara mucho tiempo, pero seguiré aprendiendo y dando todo de mi para salir de aquí.",
		"que familiar",
		"¡No! espera no dispares"
	],
	[
		#English
	]
]
var t
var p = 0
var canChange = false

func _ready():
	
	Global.obj = true
	Global.vis = false
	
	t = texto[p][textSelected].split("/")
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.text = t[0]
	$Timer.start()

func _process(delta: float) -> void:
	pass

func _input(_event):
	if self.visible:
		
		if Input.is_action_just_pressed("click") and canChange:
			if p < t.size() - 1:
				p = p+ 1
				$RichTextLabel.visible_characters = 0
				$RichTextLabel.text = t[p]
				canChange = false
			else:
				Global.obj = false
				Global.vis = true
				queue_free()


func _on_Timer_timeout() -> void:
	if $RichTextLabel.visible_characters <= len(t[p]):
		$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_characters == len(t[p]):
		canChange = true
