extends Character
class_name CharacterPlayer

func get_input_moviment() -> Vector2:
	var i: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return i.normalized()

func _process(_delta: float) -> void:
	cur_dir = get_input_moviment()
