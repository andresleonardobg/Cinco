extends Sprite

var position_in_map = Vector2(0, 0)

func _ready():
	global_position = position_in_map
	
func _process(delta: float) -> void:
	Global.map = global_position

