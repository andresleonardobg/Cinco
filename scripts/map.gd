extends Sprite

export(Vector2) var position_in_map

func _ready():
	global_position = position_in_map
