class_name MyPlane
extends Node

var distance_to_origin: int
var normal: Vector2

func _init(point_a, point_b) -> void:
	print("Building...")
	var dvec = point_a.direction_to(point_b)
	normal = Vector2(dvec.y, -dvec.x)
	distance_to_origin = normal.dot(point_a)

func calculate_distance_to(point) -> int:
	return normal.dot(point) - distance_to_origin

func get_normal() -> Vector2:
	return normal

func _to_string() -> String:
	return "Normal: ({0},{1}) and distance to origin is: {2}".format([normal.x, normal.y, distance_to_origin])
