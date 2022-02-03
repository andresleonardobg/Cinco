extends Sprite

var position_in_map = Vector2(0, 0)

func _ready():
	Global.lights_state = $lights.visible
	global_position = position_in_map
	$"lights/lights-blink/short-circuit".play("blink")
	
	Global.nav = get_tree().get_nodes_in_group('navigation')
	Global.lights = get_tree().get_nodes_in_group('lights')
	Global.nav_cam = get_tree().get_nodes_in_group('nav_cam')
	
func _process(delta: float) -> void:
	Global.map = global_position

