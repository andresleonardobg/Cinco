extends ColorRect

var texto = ""
var canClick = false

func _ready():
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.text = texto

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and $RichTextLabel.visible_characters >= len(texto) and canClick:
			self.queue_free()

func _on_Timer_timeout():
	if $RichTextLabel.visible_characters <= len(texto):
		$RichTextLabel.visible_characters += 1


func _on_Dialogues_mouse_entered():
	canClick = true
