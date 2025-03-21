extends RigidBody2D

var force: Vector2
@export var force_magnitude: int

var rng = RandomNumberGenerator.new()

func apply_collision_force(force: Vector2) -> void:
	pass

func _ready() -> void:
	var rng_x = rng.randf_range(0,120)
	var rng_y = rng.randf_range(0,120)
	var x_vector_sign = get_positive_or_negative()
	var y_vector_sign = get_positive_or_negative()
	force = Vector2(x_vector_sign * rng_x, y_vector_sign * rng_y)
	print("force: " + str(force))
	print("force magnitude: " + str(force_magnitude))
	apply_force(force_magnitude * force)

func get_positive_or_negative():
	var rng_result = rng.randf_range(-1,1)
	if rng_result > 0:
		return 1
	return -1
