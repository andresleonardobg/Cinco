 extends ColorRect

var textSelected : int

var texto = [
	[
		"El hombre se ha dormido, no le queda mucho tiempo.",
		"necesito que me ayudes, cinco/quién eres?/eso ya no importa en mi estado, como ves no aparento pasar de hoy y antes de que eso suceda necesito que hagas algo por mi/pero donde estoy/(el viejo toce no puedo hablar)/solo has lo que te digo no creo que haya más opciones por lo mucho que has visto/(toce)/toma este chip ve al cuarto que sigue a este ahí encontraras más de estos, debes reprogramarlos cerca al computador encontraras una memoria con el programa a cargar vuelve cuando hayas terminado/El hombre se ha dormido, no le queda mucho tiempo. Qué lugar es este, estaré en alguna clase de bunker, como llegue aquí",
		"ya has cargado el software, muy bien, en la salsa de herramientas encontraras la capsula, ve",
		"me he quedado varado en mitad de la nada / al salir de ese horrible planeta algunos disparos lograron averiar gran parte de la nave / pude salir y reparar gran parte de la superficie pero no ha sido suficiente / no creo que lo pueda hacer solo así que he tomado uno de los embriones de la nave y lo puse en la capsula para que madurara, no se me ocurre más  / espero no tener que despertar a mas pero no creo que logremos terminarlo por eso hago este mensaje / no soy ingeniero, hay alguna información en la nave dado que era de uno de los científicos / así fue que aprendí a despertar a uno pero. / Nos costara mucho tiempo, pero seguiré aprendiendo y dando todo de mi para salir de aquí.",
		"que familiar",
		"¡No! espera no dispares"
	],
	[
		"",
		"I need you to help me, five./who are you?/That doesn't matter anymore in my state, as you can see I don't seem to get through today and before that happens I need you to do something for me/but where am I/(the old man coughs)/ just do what I tell you I don't think there are more options because of how much you've seen/(coughs)/take this chip, go to the room that follows this one, there you will find more of these, you must reprogram them Near the computer you will find another chip Come back when you're done/The man has fallen asleep, he doesn't have much time left. What place is this? How did I get here?",
		"You have already loaded the software, very good, in the tool room you will find the capsule, go",
		"I've been stranded in the middle of nowhere / leaving that horrible planet some shots managed to damage the ship / I was able to get out and repair a lot of the surface, but it wasn't enough / I don't think I can do it alone, so I have taken one of the embryos from the ship and put it in the capsule to mature, I can't think of anything else / I hope I don't have to wake up more but I don't think we'll be able to finish it, that's why I'm making this message / I'm not an engineer, there are some information on the ship, it was from one of the scientists / so I learned how to wake one up but / It will take us a long time, but I will continue to learn and give my all to get out of here.",
		"How familiar!"
	]
]
var t
var p = 0
var canChange = false

func _ready():
	
	Global.obj = true
	Global.vis = false
	
	t = texto[Global.lenguage][textSelected].split("/")
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.text = t[0]
	$Timer.start()

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
