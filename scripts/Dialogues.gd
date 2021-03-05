extends ColorRect

var texto = ""
var t
var p = 0
var canChange = false

func _ready():
	t = texto.split("/")
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.text = t[0]
	$Timer.start()

func _input(event):
	if Input.is_action_just_pressed("click") and canChange:
		if p < t.size() - 1:
			p = p+ 1
			$RichTextLabel.visible_characters = 0
			$RichTextLabel.text = t[p]
			canChange = false
		else:
			Global.hide = true 
			self.queue_free()

func _on_Timer_timeout():
		
	if $RichTextLabel.visible_characters <= len(t[p]):
		$RichTextLabel.visible_characters += 1
	if $RichTextLabel.visible_characters == len(t[p]):
		canChange = true


func _on_Dialogues_mouse_entered():
	pass
