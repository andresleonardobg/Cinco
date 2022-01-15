extends Sprite

var position_in_map = Vector2(0, 0)

func _ready():
	Global.lights_state = $lights.visible
	global_position = position_in_map
	$"lights/lights-blink/short-circuit".play("blink")
	
func _process(delta: float) -> void:
	Global.map = global_position

