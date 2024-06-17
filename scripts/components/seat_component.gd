extends Node2D
class_name SeatComponent

@export var is_available: bool = true
var character_seated: Character

func _enter_tree() -> void:
	assert(owner is GridObject)
	owner.set_meta("SeatComponent", self)
	DataManager.register_seat(self)


func _exit_tree() -> void:
	assert(owner is GridObject)
	owner.remove_meta("SeatComponent")
	DataManager.unregister_seat(self)


func enter_seat(character: Character) -> void:
	if not is_available:
		return
	
	is_available = false
	character_seated = character


func exit_seat(character: Character) -> void:
	if character != character_seated:
		return
	
	character_seated = null
	is_available = true
