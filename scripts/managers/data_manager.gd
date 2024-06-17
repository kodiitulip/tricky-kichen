extends Node

var seats: Array[SeatComponent] = []


func find_closest_seat(pos: Vector2) -> SeatComponent:
	var available_seats: Array[SeatComponent] = seats.filter(_filter_available_seats)
	
	var dist: float = 200
	var closest: SeatComponent
	for seat: SeatComponent in available_seats:
		var d: float = seat.global_position.distance_to(pos)
		if d > dist:
			continue
		dist = d
		closest = seat
	
	return closest


func register_seat(seat: SeatComponent) -> void:
	seats.push_back(seat)


func unregister_seat(seat: SeatComponent) -> void:
	var index: int = seats.find(seat)
	seats.remove_at(index)


func _filter_available_seats(seat: SeatComponent) -> bool:
	return seat.is_available
