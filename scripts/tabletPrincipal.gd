extends Sprite

onready var nav = get_tree().get_nodes_in_group('navigation')

var lenguages = [
	[
		"lamento haberte despertado no lo quería, no quería que pasaras lo mismo que yo. Esta soledad es horrible lo único que hago es lo mismo que hicieron los otros buscar información y aprender para salir de aquí, es lo único que quiero, salir de aquí, pero creo que lo logre. Lamento que los otros no lograran terminarlo, pero con sus avances logre arreglar gran parte de lo dañado el primero logro arreglar los daños superficiales los siguientes a él logramos arreglar la parte interna, lo más difícil. Lo logre, termine, pero me tomo mucho tiempo creo que demasiado tiempo. Mi tiempo se está acabando, no creo que llegué a ningún lado por lo que decidí despertarte, uno de nosotros tenía que salir de aquí, número cinco. La contraseña para la cabina es 2051."
	],
	[
		"Sorry for waking you up, I didn't want you to go through the same thing as me. This lonelyness is horrible, the only thing I do is the same things like the others, search information and learn how to get out here, is the only what I want, get out here. But I think I made it. I'm sorry the others can't finish it, but with his advances I was able to fix most of the demage, the firts of us fixed the superficial damage those next of him we managed to fix the internal part, the hardest. I did, but toke me a long time I think too long. My time is runnig out, I don't think I got anywhere so I decided waking you up. One of us have to go out from here, numer five. The password of cabin is 2051"
	]
]

func _ready() -> void:
	$RichTextLabel2.text = lenguages[Global.lenguage][0]


func _on_Area2D_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Global.vis = true
		Global.lights_state = true
		self.visible = false
		for n in nav:
				n.visible = true
